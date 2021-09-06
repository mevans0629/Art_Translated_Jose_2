import 'package:art_translated/components/action_button.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/screens/record_page.dart';
import 'package:flutter/material.dart';

class TranslateLabel extends StatefulWidget {
  TranslateLabel({
    Key? key,
    required this.label,
    this.onTextTouched,
  }) : super(key: key);

  final Function(bool)? onTextTouched;
  final String label;

  @override
  _TranslateLabelState createState() => _TranslateLabelState();
}

class _TranslateLabelState extends State<TranslateLabel> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ActionButton(
                    textColor: Styling.getIconLightColor(),
                    onClick: () async {
                      var result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_voice,
                      color: Styling.getIconLightColor(),
                    ),
                    text: "Voice",
                    buttonColor: Styling.getLightColor(),
                    textStyle: Styling.getLabelStyle(18.0, true),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
