import 'dart:math';

import 'package:art_translated/components/buttons/howto_button.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/models/suggests.dart';
import 'package:art_translated/services/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class InputSearch extends StatefulWidget {
  InputSearch({
    Key? key,
    required this.hintText,
    required this.showHowTo,
    required this.onChanged,
    required this.onSubmitted,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String hintText;
  final bool showHowTo;
  final double width;
  final double height;
  Function onChanged;
  Function onSubmitted;

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  bool isLoading = false;
  String inputText = "";
  List<String> suggestions = [];
  late TextEditingController textEditingController;
  final int minLength = 1;

  Future fetchSuggests(String inputText) async {
    if (inputText.isNotEmpty && inputText.length > minLength) {
      setState(() {
        isLoading = true;
        suggestions = [];
      });

      Suggests suggestionsData =
          await ApiManager().getSuggests(inputText: inputText);

      setState(() {
        isLoading = false;
        suggestions = suggestionsData.data!;
      });
    }
  }

  void inputChanged(String inputText) {
    setState(() {
      inputText = inputText;
    });
    this.widget.onChanged(inputText);
    if (inputText.isNotEmpty && inputText.length > minLength) {
      fetchSuggests(inputText);
    }
  }

  String randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }

  Widget autoCompleteWidget() {
    return FutureBuilder(
      future: fetchSuggests(inputText),
      builder: (context, snapshot) {
        return Autocomplete(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty ||
                isLoading ||
                suggestions.length == 0) {
              return Iterable<String>.empty();
            } else {
              return suggestions.where((element) => element
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()));
            }
          },
          optionsViewBuilder: (context, Function(String) onSelected, options) {
            return ListTileTheme(
              contentPadding: EdgeInsets.zero,
              textColor: Colors.black,
              tileColor: Colors.white,
              style: ListTileStyle.list,
              dense: true,
              child: Container(
                height: 52.0 * options.length,
                width: 100,
                child: ListView.builder(
                  key: new Key(randomString(20)),
                  itemExtent: 50.0,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    return Container(
                      width: 100,
                      child: Card(
                        margin: EdgeInsets.zero,
                        child: ListTile(
                          dense: true,
                          contentPadding:
                              EdgeInsets.only(left: 0.0, right: 0.0),
                          title: SubstringHighlight(
                            text: option.toString(),
                            term: textEditingController.text,
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            textStyleHighlight: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          onTap: () {
                            onSelected(option.toString());
                          },
                        ),
                      ),
                    );
                  },
                  itemCount: options.length,
                ),
              ),
            );
          },
          onSelected: (value) {
            this.widget.onChanged(value);
            this.widget.onSubmitted(value);
          },
          fieldViewBuilder:
              (context, controller, focusNode, onEditingComplete) {
            this.textEditingController = controller;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              width: widget.width,
              height: widget.height,
              child: TextField(
                autofocus: false,
                controller: controller,
                focusNode: focusNode,
                onChanged: (newText) {
                  inputChanged(newText);
                },
                style: Styling.getInputTextStyle(),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: this.widget.hintText,
                  hintStyle: Styling.getInputTextStyle(),
                ),
                onSubmitted: (value) {
                  this.widget.onSubmitted(value);
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return PhysicalModel(
      elevation: 8,
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          autoCompleteWidget(),
          Positioned(
            left: 180,
            top: 2,
            child: this.widget.showHowTo
                ? HowtoButton(color: Styling.getPrimary())
                : Container(height: 30.0),
          ),
        ],
      ),
    );
  }
}
