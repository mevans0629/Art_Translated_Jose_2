import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/constants/Widgets.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Widgets.appBar(title: Strings.titleApp),
      backgroundColor: Styling.getPrimary(),
      body: ContainerLayout(
        color1: Styling.getPrimary(),
        color2: Styling.getSecondary(),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: _mediaData.size.height / 35,
              horizontal: _mediaData.size.width / 11),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: wh / 90, bottom: wh / 30),
                    child: Center(
                      child: Text(
                        'About\nArtTranslate',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: wh / 35,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    'Welcome to the first mobile app to translate the specific meanings and intentions of symbols in art.\n',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: wh / 80,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Unique from most books and other references, this app’s unique database of over 100,000 fields of information is structured to provide the meaning you are seeking to the specific symbol in a painting, sculpture, and architecture. With a symbol often having many possible  meanings, we provide results in order of probability.\n\nThe initial focus of this app is Western art. There are references to others but at this time they are not comprehensive (e.g.: Eastern culture).\n\nThe database is designed to apply to any popular symbol viewed.  The symbol could be an image you see or think of anywhere it might be encountered. For example: museum collections, parks, architecture, sculpture, art decor, movies, people’s home decor,tattoos and much more. A general guideline for the symbols is that they have a popular usage with some exceptions.\n\nPlease enjoy!',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      fontSize: wh / 90,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}