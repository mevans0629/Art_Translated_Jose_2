import 'package:art_translated/components/buttons/howto_button.dart';
import 'package:art_translated/components/buttons/nav_button.dart';
import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/input_search.dart';
import 'package:art_translated/components/action_label.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/screens/about_page.dart';
import 'package:art_translated/screens/search_results_page.dart';
import 'package:flutter/material.dart';

class TranslatorPage extends StatefulWidget {
  TranslatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage>
    with SingleTickerProviderStateMixin {
  late FocusNode _textFocusNode;
  late AnimationController _controller;
  String inputText = "";

  @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    inputText = "";
  }

  @override
  void dispose() {
    _controller.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  onTextChanged(newText) {
    inputText = newText;
  }

  onSubmitted(value) {
    if (getInputText().isNotEmpty) {
      String _inputText = getInputText();
      onTextChanged("");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(
            textToTranslate: _inputText,
          ),
        ),
      );
    }
  }

  String getInputText() {
    return inputText;
  }

  // Generate animations to enter the text to translate
  _onTextTouched(bool isTouched) {
    Tween _tween = SizeTween(
      begin: Size(0.0, kToolbarHeight),
      end: Size(0.0, 0.0),
    );

    _tween.animate(_controller);

    if (isTouched) {
      FocusScope.of(context).requestFocus(_textFocusNode);
      _controller.forward();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      _controller.reverse();
    }
  }

  _showAboutPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => AboutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final wh = _width + _height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styling.getPrimary(),
      body: ContainerLayout(
        color1: Styling.getPrimary(),
        color2: Styling.getSecondary(),
        child: Stack(
          children: [
            Positioned(
              top: -5,
              left: 0,
              right: 0,
              child: NavButton(
                  color: Colors.black87,
                  alignment: Alignment.centerRight,
                  iconData: Icons.menu),
            ),
            Positioned(
              top: 38,
              left: 0,
              right: 0,
              child: Container(
                child: Image.asset(
                  "assets/images/Art_Translated_Title.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: _size.height * 0.16,
              left: 0,
              right: 0,
              child: Container(
                child: Text("Understand the\nLanguage of Art",
                    style: Styling.getHead1Style(wh),
                    textAlign: TextAlign.center),
              ),
            ),
            Positioned(
              top: _size.height * 0.28,
              left: 0,
              right: 0,
              child: Container(
                width: _width * 0.96,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: _width * 0.68,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "What is the Object?",
                        style: Styling.getHead1Style(wh),
                      ),
                    ),
                    HowtoButton(color: Styling.getSecondary()),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _size.height * 0.35,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.black, // set border color
                      width: 1.0), // set border width
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: InputSearch(
                  hintText: "E.g. Apple, spider, violin...",
                  onChanged: onTextChanged,
                  onSubmitted: onSubmitted,
                ),
              ),
            ),
            Positioned(
              top: _size.height * 0.43,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      onSubmitted(getInputText());
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Styling.getSecondary(),
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Styling.getSecondary(),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Translate',
                              style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: wh / 55,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: _size.height * 0.90,
              left: 0,
              right: 0,
              child: ActionLabel(
                text: 'About this tool',
                onTap: _showAboutPage,
                textStyle: Styling.getLinkTextStyle(wh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
