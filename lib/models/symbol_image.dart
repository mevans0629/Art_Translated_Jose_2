import 'dart:convert';

SymbolImages symbolImagesFromJson(String str) =>
    SymbolImages.fromJson(json.decode(str));

String symbolImagesToJson(SymbolImages data) => json.encode(data.toJson());

class SymbolImages {
  SymbolImages({
    required this.id,
    required this.name,
    required this.results,
  });

  double id;
  String name;
  List<ImageFile> results;

  factory SymbolImages.fromJson(Map<String, dynamic> json) => SymbolImages(
        id: json["id"].toDouble(),
        name: json["name"],
        results: List<ImageFile>.from(
            json["images"].map((x) => ImageFile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "images": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ImageFile {
  ImageFile({
    required this.id,
    required this.url,
    required this.thumbnails,
  });

  double id;
  String url;
  List<Thumbnail> thumbnails;

  factory ImageFile.fromJson(Map<String, dynamic> json) => ImageFile(
        id: json["id"].toDouble(),
        url: json["url"],
        thumbnails: List<Thumbnail>.from(
            json["thumbnails"].map((x) => Thumbnail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "thumbnails": List<dynamic>.from(thumbnails.map((x) => x.toJson())),
      };
}

class Thumbnail {
  Thumbnail({
    required this.id,
    required this.url,
  });

  double id;
  String url;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        id: json["id"].toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
