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
  bool inputTextSelected = false;

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
    setState(() {
      this.inputText = newText;
    });
  }

  onSubmitted(value) {
    if (value.isNotEmpty) {
      setState(() {
        this.inputText = value;
        this.phase = 1;
      });
    }
  }

  onTap() {
    setState(() {
      this.inputTextSelected = true;
    });
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
      this.inputTextSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    if (phase == 0) {
      return buildTranslator(context);
    } else if (phase == 1) {
      return buildSearchResult(this.inputText, width, height);
    } else {
      return AboutPage(showGoBack: false, onClicked: () {});
    }
  }

  Widget buildTranslator(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final double fontSize = Styling.getFontSize(12.0, height);

    return ContainerLayout(
        color1: Styling.getSecondary(),
        color2: Styling.getSecondary(),
        child: initialView(width, height, fontSize));
  }

  Widget initialView(double width, double height, double fontSize) => Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: Styling.calculatePercentage(height, 15)),
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
                        width: Styling.calculatePercentage(width, 86),
                        height: Styling.calculatePercentage(height, 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Styling.calculatePercentage(height, 15),
              ),
              SizedBox(
                height: Styling.calculatePercentage(height, 2.46),
              ),
              this.inputTextSelected
                  ? Center()
                  : Center(
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
                                  width:
                                      Styling.calculatePercentage(width, 26.88),
                                  height:
                                      Styling.calculatePercentage(height, 4.93),
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
                                            fontSize: fontSize,
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
              SizedBox(
                height: Styling.calculatePercentage(height, 30),
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
                        fontSize: fontSize,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            left: Styling.calculatePercentage(width, 13.9),
            top: inputTextSelected
                ? Styling.calculatePercentage(height, 3)
                : Styling.calculatePercentage(height, 40),
            duration: Duration(milliseconds: 200),
            child: Center(
              child: Container(
                width: Styling.calculatePercentage(width, 70.19),
                height: 43.33,
                child: InputSearch(
                  hintText: "What object are you looking at?",
                  onChanged: onTextChanged,
                  onSubmitted: onSubmitted,
                  onTap: onTap,
                  showHowTo: true,
                  width: Styling.calculatePercentage(width, 72.19),
                  height: Styling.calculatePercentage(height, 7.63),
                ),
              ),
            ),
          ),
        ],
      );

  Widget buildSearchResult(
          String textToTranslate, double width, double height) =>
      ContainerLayout(
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
                      width: Styling.calculatePercentage(width, 72.19),
                      height: Styling.calculatePercentage(height, 5),
                      child: InputSearch(
                        hintText: "Search...",
                        onChanged: onTextChanged,
                        onSubmitted: onSubmitted,
                        onTap: onTap,
                        showHowTo: false,
                        width: Styling.calculatePercentage(width, 72.19),
                        height: Styling.calculatePercentage(height, 5),
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
                  SizedBox(height: 80),
                ],
              ),
            ],
          ),
        ),
      );
}
