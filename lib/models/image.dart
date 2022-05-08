class Image {
  Image({
    required this.title,
    required this.urlImage,
    required this.urlThumb,
    required this.firstImage,
  });

  String title;
  String urlImage;
  String urlThumb;
  bool firstImage;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        title: json["title"],
        urlImage: json["urlImage"],
        urlThumb: json["urlThumb"],
        firstImage: json["firstImage"],
      );
}
