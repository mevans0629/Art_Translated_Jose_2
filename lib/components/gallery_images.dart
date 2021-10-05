import 'package:art_translated/components/image_detail.dart';
import 'package:art_translated/constants/app_utils.dart';
import 'package:flutter/material.dart';

class GalleryImages extends StatefulWidget {
  GalleryImages({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  @override
  _GalleryImagesState createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          Image _image = AppUtils.loadNetworkImage(widget.images[index], 100);
          return GestureDetector(
            child: _image,
            onDoubleTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(
                  tag: "",
                  imageProvider: _image.image,
                );
              }));
            },
          );
        },
      ),
    );
  }
}
