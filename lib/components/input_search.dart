import 'dart:async';
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
    required this.onTap,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String hintText;
  final bool showHowTo;
  final double width;
  final double height;
  Function onChanged;
  Function onSubmitted;
  Function onTap;

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  late TextEditingController textEditingController;
  final int minLength = 2;
  bool isSearching = true;
  Timer? _debounce;
  List<String>? _suggestions;

  @override
  void initState() {
    _suggestions = [];
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void fetchSuggests() {
    if (textEditingController != null) {
      var inputText = textEditingController.text.toLowerCase();
      // print("Query {" + inputText + "}");
      if (inputText.isNotEmpty && inputText.length >= minLength) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(Duration(milliseconds: 200), () async {
          if (isSearching == true) {
            setState(() {
              _suggestions = [];
            });
            await ApiManager()
                .getAutoSuggests(inputText: inputText)
                .then((suggests) {
              setState(() {
                _suggestions =
                    suggests.data!.sublist(0, min(suggests.data!.length, 7));
                textEditingController.notifyListeners();
              });
              print("Data");
              print(_suggestions);
            });
          }
        });
      } else
        _suggestions = [];
    }
  }

  String randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }

  bool isValid() {
    return (textEditingController.text.isNotEmpty &&
        textEditingController.text.length >= minLength);
  }

  Widget autoCompleteWidget(double size) {
    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isNotEmpty)
          return _suggestions as Iterable<String>;
        else
          return const Iterable<String>.empty();
      },
      optionsViewBuilder: (context, Function(String) onSelected, options) {
        return ListTileTheme(
          contentPadding: EdgeInsets.zero,
          textColor: Colors.black,
          tileColor: Colors.white,
          style: ListTileStyle.list,
          dense: true,
          child: Container(
            height: 52.0 * _suggestions!.length,
            width: 100,
            child: ListView.builder(
              key: new Key(randomString(20)),
              itemExtent: 50.0,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final option = _suggestions!.elementAt(index);
                return Container(
                  width: 100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.only(left: 12.0, right: 0.0),
                      title: SubstringHighlight(
                        text: option.toString(),
                        term: textEditingController.text,
                        textStyle: TextStyle(
                          fontSize: Styling.getFontSize(12.0, size),
                          fontFamily: 'OpenSans',
                          color: Colors.black,
                        ),
                        textStyleHighlight: TextStyle(
                          fontSize: Styling.getFontSize(12.0, size),
                          color: Colors.black,
                          fontFamily: 'OpenSans',
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
              itemCount: _suggestions!.length,
            ),
          ),
        );
      },
      onSelected: (value) {
        this.widget.onChanged(value);
        this.widget.onSubmitted(value);
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        this.textEditingController = controller;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: widget.width,
          height: widget.height,
          child: TextField(
            autofocus: false,
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            style: TextStyle(
              color: Colors.black,
              fontSize: Styling.getFontSize(12.0, size),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w300,
            ),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: this.widget.hintText,
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: Styling.getFontSize(12.0, size),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w300,
              ),
            ),
            onSubmitted: (value) {
              isSearching = false;
              this.widget.onSubmitted(value);
            },
            onTap: () {
              isSearching = false;
              this.widget.onTap();
            },
            onChanged: (text) {
              isSearching = (text.isNotEmpty && text.length >= minLength);
              if (text.isEmpty || text.length < minLength)
                _suggestions = [];
              else
                fetchSuggests();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final int deviceSize = Styling.getDeviceSize(height);
    double leftPosition = 210; // Small
    if (deviceSize == 1) {
      // Medium
      leftPosition = 230;
    } else if (deviceSize == 2) {
      // Largest
      leftPosition = 253;
    }
    return PhysicalModel(
      elevation: 8,
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          autoCompleteWidget(height),
          Positioned(
            left: leftPosition,
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
