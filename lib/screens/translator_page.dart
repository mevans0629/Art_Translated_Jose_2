import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/constants/Widgets.dart';
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
    // _translateProvider.setIsTranslating(isTouched);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    MediaQueryData _mediaData = MediaQuery.of(context);

    final width = _mediaData.size.width;
    final height = _mediaData.size.height;
    final viewBottom = _mediaData.viewInsets.bottom;
    final keyboardIsOn =
        (_mediaData.viewInsets.bottom / _mediaData.size.height) > 0.2;
    final wh = width + height;

    void _clearText() {
      _textEditingController.clear();
    }

    Widget suffixIcon() {
      String? text = _textEditingController.text;
      if (text != null && text.isNotEmpty) {
        return Container(
          width: 20,
          child: Align(
            alignment: Alignment.topRight,
            child: RawMaterialButton(
              onPressed: _clearText,
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Widgets.appBar(title: Strings.titleApp),
      backgroundColor: Styling.getPrimary(),
      body: ContainerLayout(
        color1: Styling.getPrimary(),
        color2: Styling.getSecondary(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 46.0),
                child: Text(Strings.titleApp,
                    style: TextStyle(
                      color: Styling.getSecondary().withOpacity(0.6),
                      fontFamily: 'FrederickatheGreat',
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Find out what you're really looking at",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Monserrat',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 40,
                width: 300,
                child: Text("What is the Object?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Monserrat',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.16,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: height / 12,
                width: 300,
                child: Container(
                  height: height / 15,
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
                        autofocus: false,
                        onChanged: (newText) {
                          _textEditingController.text = newText;
                        },
                        style: Styling.getInputTextStyle(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "E.g. Apple, spider, violin...",
                            hintStyle: Styling.getInputTextStyle(),
                            suffixIcon: suffixIcon()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: height / 10,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // if (_textEditingController.text != null &&
                        //    _textEditingController.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResultsPage(
                                    textToTranslate: "Olympu")));
                        // }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Styling.getSecondary(),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      child: Text(
                        'Translate',
                        style: TextStyle(
                          fontFamily: 'CrimsonPro',
                          fontSize: wh / 45,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    // Text(_valueToShow),
                    if (!keyboardIsOn)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            // ignore: inference_failure_on_instance_creation
                            MaterialPageRoute(
                                builder: (BuildContext context) => AboutPage()),
                          );
                        },
                        child: Text(
                          'About this tool',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'OpenSans',
                            fontSize: wh / 100,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
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
    );
  }
}
