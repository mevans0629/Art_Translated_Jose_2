import 'package:art_translated/components/buttons/nav_button.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class NotFoundBox extends StatefulWidget {
  final String searchText;

  const NotFoundBox({Key? key, required this.searchText}) : super(key: key);

  @override
  _NotFoundBoxState createState() => _NotFoundBoxState();
}

class _NotFoundBoxState extends State<NotFoundBox> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final double _wh = _width + _height;

    return Container(
      width: _width * 0.85,
      height: _height * 0.50,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Text(
            "Sorry We Couldn’t Find Your Symbol\n" + widget.searchText,
            style: Styling.getHead1Style(_wh),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            "Please try with more context. E.g.:\n\n\u2022 Shape (round, globe, sphere)\n" +
                "\u2022 Object (staff, staff with flower, curled stick, flower)\n" +
                "\u2022 Sex (male, female)\n" +
                "\u2022 Colors (black, white)\n" +
                "\u2022 Location (church, palace)\n" +
                "\u2022 Clothes (dress, habit, armor, helmet, shield)",
            style: Styling.getBodyTextStyle(_wh),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
