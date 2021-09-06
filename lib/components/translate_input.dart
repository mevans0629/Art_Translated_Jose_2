import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class TranslateInput extends StatefulWidget {
  TranslateInput({
    Key? key,
    required this.onCloseClicked,
    required this.focusNode,
    required this.textEditingController,
  }) : super(key: key);

  final Function() onCloseClicked;
  final FocusNode focusNode;
  final TextEditingController textEditingController;

  @override
  _TranslateInputState createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  _clearInputText() {
    if (this.widget.textEditingController.text != "") {
      setState(() {
        this.widget.textEditingController.clear();
      });
    }
    widget.onCloseClicked();
  }

  _translatingText(String text) {}

  @override
  Widget build(BuildContext context) {
    _translatingText(this.widget.textEditingController.text);

    Widget _suffixIcon() {
      String? text = this.widget.textEditingController.text;
      if (text != null && text.isNotEmpty) {
        return Container(
          width: 20,
          child: Align(
            alignment: Alignment.topRight,
            child: RawMaterialButton(
              onPressed: _clearInputText,
              child:
                  Icon(Icons.close, color: Styling.getInputTextStyle().color),
              shape: CircleBorder(),
            ),
          ),
        );
      } else {
        return Container(
          width: 20,
        );
      }
    }

    return Container(
      height: 60,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Styling.getLightColor(),
        border: Border.all(
            color: Colors.black, // set border color
            width: 1.0), // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius
      ),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            onChanged: (newText) {
              this.widget.textEditingController.text = newText;
            },
            style: Styling.getInputTextStyle(),
            controller: this.widget.textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(4),
                hintText: "E.g. Apple, spider, violin...",
                hintStyle: Styling.getInputTextStyle(),
                suffixIcon: _suffixIcon()),
          ),
        ],
      ),
    );
  }
}
