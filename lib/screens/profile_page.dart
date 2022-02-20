import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/profile/numbers.dart';
import 'package:art_translated/components/profile/profile_image.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/models/user.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User _user = new User(
      imagePath: "assets/images/avatar_icon.jpeg",
      name: "Mark Evans",
      email: "info@arttranslated.com",
      about:
          "Welcome to the first mobile app to translate the specific meanings and intentions of symbols in art",
      isDarkMode: false);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final wh = _width + _height;

    return ContainerLayout(
      color1: Styling.getSecondary(),
      color2: Styling.getPrimary(),
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileImage(
                  imagePath: _user.imagePath,
                  onClicked: () async {},
                ),
                const SizedBox(
                  height: 24,
                ),
                buildName(_user),
                const SizedBox(
                  height: 24,
                ),
                NumbersWidget(),
                const SizedBox(
                  height: 48,
                ),
                buildAbout(_user),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            user.email,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black38,
              fontSize: 14,
            ),
          ),
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              user.about,
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 14, height: 1.2),
            ),
          ],
        ),
      );
}
