import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Loader() : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Styling.getSecondary()),
      ),
    );
  }
}
