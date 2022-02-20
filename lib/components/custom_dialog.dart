import 'package:art_translated/components/buttons/nav_button.dart';
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
      elevation: 4,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;

    return Stack(
      children: <Widget>[
        Container(
          width: _width * 0.85,
          height: _height * 0.85,
          decoration: BoxDecoration(
            border: Border.all(color: this.widget.color, width: 5),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: _height / 25, horizontal: _width / 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavButton(
                  color: Colors.black87,
                  alignment: Alignment.centerRight,
                  iconData: Icons.close,
                  onClicked: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Monserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget.descriptions,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Monserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
