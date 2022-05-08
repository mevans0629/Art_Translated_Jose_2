import 'package:art_translated/models/image.dart';

class Datum {
  Datum({
    required this.images,
    required this.id,
    required this.name,
    this.subject,
    this.meaningType,
    this.meaning,
    this.imageContextDescription,
    this.gender,
    this.disambiguate,
    required this.probability,
  });

  List<Image> images;
  double id;
  String name;
  String? subject;
  String? meaningType;
  String? meaning;
  String? imageContextDescription;
  String? gender;
  String? disambiguate;
  int probability;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        id: json["id"].toDouble(),
        name: json["name"],
        subject: json["subject"],
        meaningType: json["meaningType"],
        meaning: json["meaning"],
        imageContextDescription: json["imageContextDescription"],
        gender: json["gender"],
        disambiguate: json["disambiguate"],
        probability: json["probability"],
      );

  bool hasImages() {
    if (images != null && images.length > 0) {
      return true;
    }
    return false;
  }

  String getFirstImageUrl() {
    if (images.length == 0) {
      return "";
    }
    var url = images[0].urlImage;
    images.forEach((image) => {
          if (image.firstImage) {url = image.urlImage}
        });
    return url;
  }

  String getImageUrl(int index) {
    if (images.length == 0 || images.length < index) {
      return "";
    }
    return images[index].urlImage;
  }

  String getFirstThumbUrl() {
    if (images.length == 0) {
      return "";
    }
    var url = images[0].urlThumb;
    images.forEach((image) => {
          if (image.firstImage) {url = image.urlThumb}
        });
    return url;
  }

  String getThumbUrl(int index) {
    if (images.length == 0 || images.length < index) {
      return "";
    }
    return images[index].urlThumb;
  }
}
