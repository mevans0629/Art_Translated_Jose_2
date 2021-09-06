import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ActionLabel extends StatefulWidget {
  ActionLabel(
      {Key? key,
      this.icon,
      required this.text,
      this.imageIcon,
      required this.onTap,
      required this.textColor,
      required this.textStyle})
      : super(key: key);

  final TextStyle textStyle;
  final Color textColor;
  final Icon? icon;
  final AssetImage? imageIcon;
  final String text;
  final Function onTap;

  @override
  _ActionLabelState createState() => _ActionLabelState();
}

class _ActionLabelState extends State<ActionLabel> {
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
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: this.widget.text,
                  recognizer: TapGestureRecognizer()
                    ..onTap = this.widget.onTap(),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: this.widget.text,
                  recognizer: TapGestureRecognizer()
                    ..onTap = this.widget.onTap(),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
