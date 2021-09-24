import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/custom_dialog.dart';
import 'package:art_translated/components/toolbar.dart';
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
  }

  @override
  void dispose() {
    _controller.dispose();
    _textFocusNode.dispose();
    super.dispose();
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
    TextEditingController _textEditingController = TextEditingController();
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final wh = _width + _height;

    void _clearText() {
      _textEditingController.clear();
    }

    Widget suffixIcon(double wh) {
      String? text = _textEditingController.text;
      if (text.isNotEmpty) {
        return Container(
          width: 20,
          child: Align(
            alignment: Alignment.topRight,
            child: RawMaterialButton(
              onPressed: _clearText,
              child:
                  Icon(Icons.close, color: Styling.getInputTextStyle(wh).color),
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styling.getPrimary(),
      body: ContainerLayout(
        color1: Styling.getPrimary(),
        color2: Styling.getSecondary(),
        child: Stack(
          children: <Widget>[
            Toolbar(showMenu: true),
            Positioned(
              top: 30,
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
              top: _size.height * 0.15,
              left: 0,
              right: 0,
              child: Container(
                child: Text("Understand the\nLanguage of Art",
                    style: Styling.getHead1Style(wh),
                    textAlign: TextAlign.center),
              ),
            ),
            Positioned(
              top: _size.height * 0.35,
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
                    Container(
                      width: 35,
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBox(
                                color: Styling.getSecondary(),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _size.height * 0.42,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        onChanged: (newText) {
                          _textEditingController.text = newText;
                        },
                        style: Styling.getInputTextStyle(wh),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "E.g. Apple, spider, violin...",
                          hintStyle: Styling.getInputTextStyle(wh),
                          suffixIcon: suffixIcon(wh),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _size.height * 0.50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        if (_textEditingController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultsPage(
                                textToTranslate: _textEditingController.text,
                              ),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Styling.getSecondary(),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
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
