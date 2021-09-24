import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  NavButton({
    Key? key,
    required this.color,
    required this.alignment,
    required this.forBack,
  }) : super(key: key);

  final bool forBack;
  final Color color;
  final AlignmentGeometry alignment;

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  Icon iconForClose(Color color) {
    if (this.widget.forBack) {
      return Icon(
        Icons.arrow_back_outlined,
        color: color,
      );
    } else {
      return Icon(
        Icons.close,
        color: color,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.widget.alignment,
      child: OutlinedButton(
        onPressed: () => Navigator.of(context).pop(),
        child: iconForClose(this.widget.color),
      ),
    );
  }
}
