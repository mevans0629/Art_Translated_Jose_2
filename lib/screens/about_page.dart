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
                              child: Text(
                                'About\nArtTranslated',
                                style:
                                    Styling.getTitleTextStyle(Colors.black, wh),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Text(
                            'Welcome to the first mobile app to translate the specific meanings and intentions of symbols in art.\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Monserrat',
                                fontSize: fontSize,
                                fontWeight: FontWeight.w300,
                                height: 1.2),
                          ),
                          Text(
                            'Unique from most books and other references, this app’s unique database of over 100,000 fields of information is structured to provide the meaning you are seeking to the specific symbol in a painting, sculpture, and architecture. With a symbol often having many possible  meanings, we provide results in order of probability.\n\nThe initial focus of this app is Western art. There are references to others but at this time they are not comprehensive (e.g.: Eastern culture).\n\nThe database is designed to apply to any popular symbol viewed.  The symbol could be an image you see or think of anywhere it might be encountered. For example: museum collections, parks, architecture, sculpture, art decor, movies, people’s home decor,tattoos and much more. A general guideline for the symbols is that they have a popular usage with some exceptions.\n\nPlease enjoy!',
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
