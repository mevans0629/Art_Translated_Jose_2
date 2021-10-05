import 'package:flutter/material.dart';

class ActionLabel extends StatefulWidget {
  ActionLabel(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.textStyle,
      this.textAlign})
      : super(key: key);

  final TextStyle textStyle;
  TextAlign? textAlign;
  final String text;
  Function onTap;

  @override
  _ActionLabelState createState() => _ActionLabelState();
}

class _ActionLabelState extends State<ActionLabel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.widget.onTap();
      },
      child: Text(
        this.widget.text,
        style: this.widget.textStyle,
        textAlign: this.widget.textAlign != null
            ? this.widget.textAlign
            : TextAlign.center,
      ),
    );
  }
}
