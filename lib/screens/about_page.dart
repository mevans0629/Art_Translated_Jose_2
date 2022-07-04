import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/toolbar.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  final VoidCallback? onClicked;
  final bool showGoBack;

  AboutPage({Key? key, required this.showGoBack, required this.onClicked})
      : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaData = MediaQuery.of(context);
    final width = _mediaData.size.width;
    final height = _mediaData.size.height;
    final wh = width + height;

    final double fontSize = Styling.getFontSize(14, height);
    final image = AssetImage('assets/images/icon.png');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styling.getSecondary(),
      body: ContainerLayout(
        color1: Styling.getSecondary(),
        color2: Styling.getSecondary(),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Toolbar(
                      showShadow: false,
                      showGoBack: widget.showGoBack,
                      onClicked: widget.onClicked!,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width / 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: wh / 290, bottom: wh / 30),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  new Image.asset(
                                    'assets/images/icon.png',
                                    width: wh / 10,
                                    height: wh / 10,
                                  ),
                                  Text(
                                    '\nAbout\nArt Translated for Symbols',
                                    style: Styling.getTitleTextStyle(
                                        Colors.black, wh / 1.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome to the first mobile app to translate the specific meanings and messages of symbols in art. Unique from most books and other references, this app’s unique database of over 100,000 fields of information is structured to provide the precise meaning you are seeking to the specific symbol in a painting, sculpture, or architecture. Because a symbol often has many possible  meanings our innovative database will provide results in an order of probability of the meaning.',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Monserrat',
                                fontSize: fontSize,
                                fontWeight: FontWeight.w300,
                                height: 1.2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'The initial focus of this app is Western art. But there is some limited coverage of other areas of art such as the Oriental Art.',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Monserrat',
                                fontSize: fontSize,
                                fontWeight: FontWeight.w300,
                                height: 1.2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Use this app to research symbols in art work, an image you see or think of anywhere it might be encountered. For example: in museum collections, in parks, flowers, in architecture, as sculpture, as art decor, in movies, as people’s home decor, as tattoos and more.\n\nPlease enjoy!',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Monserrat',
                                fontSize: fontSize,
                                fontWeight: FontWeight.w300,
                                height: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
