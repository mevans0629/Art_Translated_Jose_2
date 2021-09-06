import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  ActionButton(
      {Key? key,
      this.icon,
      required this.text,
      this.imageIcon,
      required this.onClick,
      required this.buttonColor,
      required this.textColor,
      required this.textStyle})
      : super(key: key);

  final TextStyle textStyle;
  final Color buttonColor;
  final Color textColor;
  final Icon? icon;
  final AssetImage? imageIcon;
  final String text;
  final Function onClick;

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  StatelessWidget? _displayIcon() {
    if (this.widget.icon != null) {
      return this.widget.icon;
    } else if (this.widget.imageIcon != null) {
      return ImageIcon(
        this.widget.imageIcon,
        size: 23.0,
        color: Colors.blue[800],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? _icon = _displayIcon();

    if (_icon == null) {
      return Container(
        height: 35,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              this.widget.onClick();
            },
            textColor: this.widget.textColor,
            color: this.widget.buttonColor,
            child: Text(
              this.widget.text,
              style: this.widget.textStyle,
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 35,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              this.widget.onClick();
            },
            textColor: this.widget.textColor,
            color: this.widget.buttonColor,
            child: Text(
              this.widget.text,
              style: this.widget.textStyle,
            ),
          ),
        ),
      );
    }
  }
}
