import 'package:art_translated/components/custom_dialog.dart';
import 'package:flutter/material.dart';

class HowtoButton extends StatefulWidget {
  HowtoButton({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  _HowtoButtonState createState() => _HowtoButtonState();
}

class _HowtoButtonState extends State<HowtoButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              color: this.widget.color,
              title: "How to use\nArtTranslated",
              descriptions:
                  "The more information you write or verbalize into the search box the more precise the results will be.\n\nYou can either ask about a specific object or person i.e.: apple, or provide more context to find a higher probability of the meaning i.e.: sex of person (man), object description (apple or round), location of the art work (church), context (christian religion), geography (Rome), number (2), format (sculpture)",
            );
          },
        );
      },
      child: Icon(
        Icons.info,
        color: Colors.grey,
      ),
    );
  }
}
