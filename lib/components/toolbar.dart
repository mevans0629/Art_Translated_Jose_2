import 'package:art_translated/components/buttons/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Toolbar extends StatefulWidget {
  Toolbar({Key? key, required this.showMenu}) : super(key: key);

  final bool showMenu;

  Color menuItemColor = Colors.black87;

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  Widget menuButton(bool showMenu) {
    if (showMenu) {
      return Align(
        alignment: Alignment.topRight,
        child: OutlinedButton(
          onPressed: () {},
          child: Icon(
            Icons.menu,
            color: this.widget.menuItemColor,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget backButton(bool showMenu) {
    if (showMenu) {
      return Container();
    } else {
      return NavButton(
          color: this.widget.menuItemColor,
          alignment: Alignment.topRight,
          forBack: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final double _w = (_size.width * 0.92) / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, _size.height * 0.1),
        child: Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Container(
            width: _w,
            height: _size.height * 0.1,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [backButton(this.widget.showMenu)],
                  ),
                  Column(
                    children: [menuButton(this.widget.showMenu)],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(),
    );
  }
}
