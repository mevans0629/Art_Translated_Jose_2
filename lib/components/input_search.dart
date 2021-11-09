import 'dart:math';

import 'package:art_translated/components/loader.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/models/suggests.dart';
import 'package:art_translated/services/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class InputSearch extends StatefulWidget {
  InputSearch({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.onSubmitted,
  }) : super(key: key);

  final String hintText;
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

  Widget autoCompleteWidget(final wh) {
    return FutureBuilder(
      future: fetchSuggests(inputText),
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Autocomplete(
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
                optionsViewBuilder:
                    (context, Function(String) onSelected, options) {
                  return ListTileTheme(
                    contentPadding: EdgeInsets.zero,
                    textColor: Colors.black,
                    tileColor: Colors.white,
                    style: ListTileStyle.list,
                    dense: true,
                    child: Container(
                      height: 52.0 * options.length,
                      width: 120,
                      child: ListView.builder(
                          key: new Key(randomString(20)),
                          itemExtent: 50.0,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return Container(
                              width: 120,
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
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                    textStyleHighlight: TextStyle(
                                      fontSize: 15.0,
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
                          itemCount: options.length),
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
                  return TextField(
                    autofocus: false,
                    controller: controller,
                    focusNode: focusNode,
                    onChanged: (newText) {
                      inputChanged(newText);
                    },
                    style: Styling.getInputTextStyle(wh),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: this.widget.hintText,
                      hintStyle: Styling.getInputTextStyle(wh),
                    ),
                    onSubmitted: (value) {
                      this.widget.onSubmitted(value);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final wh = _width + _height;

    void clearText() {
      textEditingController.clear();
      widget.onChanged("");
    }

    return Stack(
      alignment: const Alignment(1.0, 1.0),
      children: <Widget>[
        autoCompleteWidget(wh),
        IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black87,
          ),
          onPressed: () {
            clearText();
          },
        ),
      ],
    );
  }
}
