import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class Widgets {
  static PreferredSizeWidget appBar({required String title}) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Styling.getPrimary(),
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );
  }

  static Container bottomNavigationBar() => Container(
        height: 55.0,
        child: BottomAppBar(
          color: Styling.getPrimary(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_box, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
      );
}
