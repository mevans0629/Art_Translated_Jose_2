import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static AppBar appBar({required String title}) {
    return AppBar(
      elevation: 0,
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

  static Image notFoundImage({required double width}) => Image.asset(
        "assets/images/file_notfound.png",
        fit: BoxFit.contain,
        width: width,
      );

  static Image loadNetworkImage(String url, double width) {
    Image _image;
    if (url.isNotEmpty) {
      _image = Image.network(
        url,
        fit: BoxFit.contain,
        width: width,
        errorBuilder: (context, error, stackTrace) {
          _image = notFoundImage(width: width);
          return _image;
        },
      );
    } else {
      _image = notFoundImage(width: width);
    }
    return _image;
  }
}
