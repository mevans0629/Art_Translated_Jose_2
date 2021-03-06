import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  NavButton({
    Key? key,
    required this.color,
    required this.alignment,
    required this.iconData,
    required this.onClicked,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final AlignmentGeometry alignment;
  final VoidCallback onClicked;

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.widget.alignment,
      child: OutlinedButton(
        onPressed: widget.onClicked,
        child: Icon(this.widget.iconData, color: this.widget.color),
      ),
    );
  }
}
