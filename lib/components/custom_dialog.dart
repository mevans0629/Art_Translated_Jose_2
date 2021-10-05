import 'package:art_translated/components/buttons/nav_button.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title;
  final String descriptions;
  final Color color;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.color})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final double _wh = _width + _height;

    return Stack(
      children: <Widget>[
        Container(
          width: _width * 0.80,
          height: _height * 0.80,
          decoration: BoxDecoration(
            border: Border.all(color: this.widget.color, width: 5),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: _height / 35, horizontal: _width / 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavButton(
                  color: Colors.black87,
                  alignment: Alignment.centerRight,
                  iconData: Icons.close,
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: Styling.getTitleTextStyle(Colors.black, _wh),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget.descriptions,
                  style: Styling.getBodyTextStyle(_wh),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
