import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

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
        TextField(
            autofocus: false,
            controller: textEditingController,
            onChanged: (newText) {
              this.widget.onChanged(newText);
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
            }),
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
