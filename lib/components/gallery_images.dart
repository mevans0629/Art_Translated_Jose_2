import 'package:art_translated/components/image_detail.dart';
import 'package:art_translated/components/loader.dart';
import 'package:art_translated/constants/app_utils.dart';
import 'package:art_translated/models/symbol_image.dart';
import 'package:art_translated/services/apimanager.dart';
import 'package:flutter/material.dart';

class GalleryImages extends StatefulWidget {
  GalleryImages({Key? key, required this.symbolId}) : super(key: key);

  final double symbolId;

  @override
  _GalleryImagesState createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SymbolImages>(
      future: ApiManager().getSymbolImages(symbolId: widget.symbolId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.results != null &&
              snapshot.data!.results.length > 0) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    snapshot.data != null ? snapshot.data!.results.length : 1,
                itemBuilder: (context, index) {
                  Image _image = AppUtils.loadNetworkImage(
                      snapshot.data!.results[index].url, 100);
                  return GestureDetector(
                    child: _image,
                    onTap: () {
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
          } else
            return Container();
        } else
          return Loader();
      },
    );
  }
}
