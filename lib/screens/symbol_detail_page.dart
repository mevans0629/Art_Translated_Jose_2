import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/gallery_images.dart';
import 'package:art_translated/components/image_detail.dart';
import 'package:art_translated/components/image_wrapper.dart';
import 'package:art_translated/components/toolbar.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/constants/app_utils.dart';
import 'package:art_translated/models/symbols.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class SymbolDetailPage extends StatefulWidget {
  final Symbol symbol;
  SymbolDetailPage({Key? key, required this.symbol}) : super(key: key);
  @override
  _SymbolDetailPageState createState() => _SymbolDetailPageState();
}

class _SymbolDetailPageState extends State<SymbolDetailPage> {
  late final Image _image;
  bool hasImage = true;

  @override
  initState() {
    if (widget.symbol.images.isNotEmpty &&
        widget.symbol.images.length == 2 &&
        widget.symbol.images[0].isNotEmpty) {
      _image = Image.network(
        widget.symbol.images[0],
        fit: BoxFit.contain,
        width: 400,
        errorBuilder: (context, error, stackTrace) {
          _image = AppUtils.notFoundImage(width: 400);
          hasImage = false;
          return _image;
        },
      );
    } else {
      _image = AppUtils.notFoundImage(width: 400);
      hasImage = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;
    final double _wh = _width + _height;

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          width: _width,
          child: GestureDetector(
              child: ImageWrapper(
                imageProvider: _image.image,
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
              onDoubleTap: () {
                if (hasImage) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                      tag: widget.symbol.name,
                      imageProvider: _image.image,
                    );
                  }));
                }
              }),
        ),
      ],
    );

    final bottomContentText = Text(
      widget.symbol.meaning,
      style: Styling.getDetailsTextStyle(_wh),
    );

    final bottomDescriptionText = Text(
      widget.symbol.description,
      style: Styling.getDetailsTextStyle(_wh),
    );

    final bottomContent = Container(
      width: _width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            Container(
              height: 100,
              child: GalleryImages(
                images: widget.symbol.images,
              ),
            ),
            bottomDescriptionText,
          ],
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styling.getSecondary(),
      body: ContainerLayout(
        color1: Styling.getSecondary(),
        color2: Styling.getPrimary(),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Toolbar(
                      showShadow: false,
                      showGoBack: true,
                    ),
                    Container(
                      width: _width,
                      padding: EdgeInsets.only(top: 5.0),
                      child: Center(
                        child: Text(
                          widget.symbol.name,
                          style: Styling.getTitleTextStyle(Colors.black87, _wh),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[topContent, bottomContent],
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
