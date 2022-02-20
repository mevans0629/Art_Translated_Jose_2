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

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: _h1,
              color: Colors.white,
              child: Container(
                height: _h2,
                width: _size.width * 0.99,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: this.widget.child,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
