import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageWrapper extends StatelessWidget {
  ImageWrapper({
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.basePosition = Alignment.center,
    this.filterQuality = FilterQuality.none,
    this.disableGestures,
    this.errorBuilder,
    this.aspectRatio = 500,
  }) : super();

  final ImageProvider? imageProvider;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final Alignment basePosition;
  final FilterQuality filterQuality;
  final bool? disableGestures;
  final ImageErrorWidgetBuilder? errorBuilder;
  final int aspectRatio;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final double _wh = _width + _height;

    return Center(
      // Dynamically set a fixed size for the child widget,
      // so that it takes up the most possible screen space
      // while adhering to the defined aspect ratio
      child: AspectRatio(
        aspectRatio: _wh / this.aspectRatio,
        // Puts a "mask" on the child, so that it will keep its original, unzoomed size
        // even while it's being zoomed in
        child: ClipRect(
          child: PhotoView(
            imageProvider: imageProvider,
            loadingBuilder: loadingBuilder,
            backgroundDecoration: backgroundDecoration,
            minScale: minScale,
            maxScale: maxScale,
            initialScale: initialScale,
            basePosition: basePosition,
            filterQuality: filterQuality,
            disableGestures: disableGestures,
            errorBuilder: errorBuilder,
          ),
        ),
      ),
    );
  }
}
