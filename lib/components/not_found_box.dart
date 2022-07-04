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
            height: 35,
          ),
          Text(
            "Sorry, we could not find a result\n",
            style: Styling.getHead1Style(_wh),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 45,
          ),
          Text(
            "Please type another object you see on this artwork and click a suggestion from our innovative auto-suggest list to find the precise object, meaning and image examples.",
            style: Styling.getBodyTextStyle(_wh),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "If you don’t see the precise auto-suggest description just stay with your generic input (globe) and review all the results.",
            style: Styling.getBodyTextStyle(_wh),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
