import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/widgets.dart';

class ContainerLayout extends StatefulWidget {
  ContainerLayout(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.child})
      : super(key: key);

  final Color color1;
  final Color color2;
  Widget child;

  @override
  _ContainerLayoutState createState() => _ContainerLayoutState();
}

class _ContainerLayoutState extends State<ContainerLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      color: this.widget.color1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        color: this.widget.color2,
        child: Container(
          color: Styling.getLightColor(),
          child: this.widget.child,
        ),
      ),
    );
  }
}
