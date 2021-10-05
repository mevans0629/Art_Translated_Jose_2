import 'package:art_translated/components/buttons/nav_button.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  Toolbar(
      {Key? key,
      required this.showShadow,
      required this.showGoBack,
      this.title,
      this.mid,
      this.right})
      : super(key: key);

  String? title;
  final bool showGoBack;
  final bool showShadow;
  Widget? mid;
  Widget? right;

  @override
  Widget build(BuildContext context) {
    Decoration? _showShadow() {
      if (showShadow) {
        return const BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: const Radius.circular(10.0),
            bottomRight: const Radius.circular(10.0),
          ),
          boxShadow: <BoxShadow>[
            const BoxShadow(
                color: Colors.black12, spreadRadius: 10.0, blurRadius: 20.0)
          ],
        );
      } else {
        return null;
      }
    }

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 15.0, 5.0),
        decoration: _showShadow(),
        child: Row(
          children: <Widget>[
            Expanded(
              child: showGoBack
                  ? NavButton(
                      color: Colors.black87,
                      alignment: Alignment.centerLeft,
                      iconData: Icons.chevron_left)
                  : Container(
                      height: 40.0,
                    ),
            ),
            Expanded(
              child: mid != null
                  ? Align(alignment: Alignment.center, child: mid)
                  : Container(
                      height: 40.0,
                    ),
            ),
            Expanded(
              child: right != null
                  ? Align(alignment: Alignment.centerRight, child: right)
                  : Container(
                      height: 40.0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
