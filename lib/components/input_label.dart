import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class InputLabel extends StatefulWidget {
  InputLabel({
    Key? key,
    required this.label,
    this.onTextTouched,
  }) : super(key: key);

  final Function(bool)? onTextTouched;
  final String label;

  @override
  _InputLabelState createState() => _InputLabelState();
}

class _InputLabelState extends State<InputLabel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Styling.getLightColor(),
      margin: EdgeInsets.all(0.0),
      elevation: 2.0,
      child: Container(
        height: 180.0,
        color: Styling.getLightColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  this.widget.onTextTouched!(true);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Text(
                    this.widget.label,
                    style: Styling.getInputTextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
