import 'package:flutter/material.dart';

class ContainerLayout extends StatefulWidget {
  ContainerLayout({
    Key? key,
    required this.color1,
    required this.color2,
    required this.child,
  }) : super(key: key);

  final Color color1;
  final Color color2;
  final Widget child;

  @override
  _ContainerLayoutState createState() => _ContainerLayoutState();
}

class _ContainerLayoutState extends State<ContainerLayout> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final double _h1 = _size.height * 0.98;
    final double _h2 = _h1 * 0.98;
    final double _h3 = _h2 * 0.98;

    return Stack(
      children: <Widget>[
        Positioned(
          top: 15,
          left: 0,
          right: 0,
          child: Container(
            height: _h1,
            color: this.widget.color1,
            child: Container(
              height: _h2,
              width: _size.width * 0.99,
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Container(
                height: _h3,
                width: _size.width * 0.99,
                child: this.widget.child,
                decoration: BoxDecoration(
                  border: Border.all(color: this.widget.color2, width: 6),
                ),
              ),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
