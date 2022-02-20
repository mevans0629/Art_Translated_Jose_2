import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildButton(context, '4.8', 'Ranking'),
            builDivider(),
            buildButton(context, '35', 'Following'),
            builDivider(),
            buildButton(context, '50', 'Followers'),
          ],
        ),
      );

  Widget builDivider() => Container(height: 24, child: VerticalDivider());

  Widget buildButton(BuildContext context, String value, String label) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
}
