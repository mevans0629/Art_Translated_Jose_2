import 'package:art_translated/components/image_detail.dart';
import 'package:art_translated/components/image_wrapper.dart';
import 'package:art_translated/models/datum.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageTop extends StatefulWidget {
  final Datum symbol;
  final Image image;
  final double width;
  final double height;
  final int aspectRatio;
  final bool hasImage;

  const ImageTop({
    Key? key,
    required this.symbol,
    required this.hasImage,
    required this.width,
    required this.height,
    required this.aspectRatio,
    required this.image,
  });

  @override
  _ImageTopState createState() => _ImageTopState();
}

class _ImageTopState extends State<ImageTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
          child: ImageWrapper(
            imageProvider: widget.image.image,
            aspectRatio: widget.aspectRatio,
            backgroundDecoration: BoxDecoration(color: Colors.white),
            minScale: PhotoViewComputedScale.contained * 0.9,
            maxScale: PhotoViewComputedScale.covered * 2,
            disableGestures: true,
            loadingBuilder: (context, event) {
              if (event == null) {
                return const Center(
                  child: Text("Loading"),
                );
              }

              final value = event.cumulativeBytesLoaded /
                  (event.expectedTotalBytes ?? event.cumulativeBytesLoaded);

              final percentage = (100 * value).floor();
              return Center(
                child: Text("$percentage%"),
              );
            },
          ),
          onTap: () {
            if (widget.hasImage) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(
                  tag: widget.symbol.name,
                  imageProvider: widget.image.image,
                );
              }));
            }
          }),
    );
  }
}
