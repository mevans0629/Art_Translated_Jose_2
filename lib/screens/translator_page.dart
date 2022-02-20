import 'package:art_translated/components/buttons/howto_button.dart';
import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/input_search.dart';
import 'package:art_translated/components/action_label.dart';
import 'package:art_translated/components/search_result_list.dart';
import 'package:art_translated/components/toolbar.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/screens/about_page.dart';
import 'package:flutter/material.dart';

class TranslatorPage extends StatefulWidget {
  final ScrollController scrollController;

  TranslatorPage({Key? key, required this.scrollController}) : super(key: key);

  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage>
    with SingleTickerProviderStateMixin {
  late FocusNode _textFocusNode;
  late AnimationController _controller;
  String inputText = "";

  int phase = 0;

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
      setState(() {
        this.phase = 1;
      });
    }
  }

  String getInputText() {
    return inputText;
  }

  void showAboutPage() {
    setState(() {
      this.phase = 4;
    });
  }

  void goBack() {
    setState(() {
      this.phase = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;

    if (phase == 0) {
      return buildTranslator(_height);
    } else if (phase == 1) {
      return buildSearchResult(inputText);
    } else {
      return AboutPage(showGoBack: false, onClicked: () {});
    }
  }

  Widget buildTranslator(double height) => ContainerLayout(
        color1: Styling.getSecondary(),
        color2: Styling.getSecondary(),
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Stack(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage(
                            "assets/images/Art_Translated_Title.png",
                          ),
                          fit: BoxFit.contain,
                          width: 275,
                          height: 84,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 58,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 231,
                        height: 43.33,
                        child: InputSearch(
                          hintText: "What object are you looking at?",
                          onChanged: onTextChanged,
                          onSubmitted: onSubmitted,
                          showHowTo: true,
                          width: 231,
                          height: 43.33,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Center(
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onSubmitted(getInputText());
                            },
                            child: Container(
                              width: 86,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Styling.getPrimary(),
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Styling.getPrimary(),
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
                                        fontSize: 12,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 220,
                ),
                Center(
                  child: Stack(
                    children: [
                      ActionLabel(
                        text: 'About this tool',
                        onTap: showAboutPage,
                        textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildSearchResult(String textToTranslate) => ContainerLayout(
        color1: Styling.getSecondary(),
        color2: Styling.getPrimary(),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Toolbar(
                    showShadow: false,
                    showGoBack: true,
                    onClicked: goBack,
                    mid: Container(
                      width: 231,
                      height: 43.33,
                      child: InputSearch(
                        hintText: "Search...",
                        onChanged: onTextChanged,
                        onSubmitted: onSubmitted,
                        showHowTo: false,
                        width: 231,
                        height: 43.33,
                      ),
                    ),
                    right: HowtoButton(
                      color: Styling.getPrimary(),
                    ),
                  ),
                  SizedBox(height: 6),
                  SearchResultListView(
                    searchText: textToTranslate,
                    scrollController: widget.scrollController,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
