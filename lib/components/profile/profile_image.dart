import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final String imagePath;
  final VoidCallback onClicked;

  ProfileImage({Key? key, required this.imagePath, required this.onClicked})
      : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    final color = Styling.getPrimary();

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEdition(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = AssetImage(widget.imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: widget.onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEdition(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
            child: Icon(
              Icons.edit,
              size: 20,
              color: Colors.white,
            ),
            all: 8,
            color: color),
      );

  Widget buildCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
