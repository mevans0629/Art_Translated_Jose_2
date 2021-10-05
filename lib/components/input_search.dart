import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class InputSearch extends StatefulWidget {
  InputSearch({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.clearText,
  }) : super(key: key);

  final String hintText;
  Function onChanged;
  Function clearText;

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final wh = _width + _height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: TextField(
            autofocus: false,
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
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black87,
          ),
          onPressed: () {
            this.widget.clearText();
          },
        ),
      ],
    );
  }
}
