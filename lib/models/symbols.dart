// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Symbols welcomeFromJson(String str) => Symbols.fromJson(json.decode(str));

String welcomeToJson(Symbols data) => json.encode(data.toJson());

class Symbols {
  Symbols({
    required this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Symbol>? results;

  factory Symbols.fromJson(Map<String, dynamic> json) => Symbols(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Symbol>.from(json["results"].map((x) => Symbol.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Symbol {
  Symbol({
    required this.id,
    required this.name,
    required this.meaning,
    this.imageContextDescription,
    required this.probability,
    this.keywords,
    this.attributeValues,
    this.images,
    this.firstImage,
    this.altNames,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  int id;
  String name;
  String meaning;
  String? imageContextDescription;
  int probability;
  List<Keyword>? keywords;
  List<AttributeValue>? attributeValues;
  List<Image>? images;
  dynamic firstImage;
  List<AltName>? altNames;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deleted;

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        id: json["id"],
        name: json["name"],
        meaning: json["meaning"],
        imageContextDescription: json["image_context_description"],
        probability: json["probability"],
        keywords: List<Keyword>.from(
            json["keywords"].map((x) => Keyword.fromJson(x))),
        attributeValues: List<AttributeValue>.from(
            json["attribute_values"].map((x) => AttributeValue.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        firstImage: json["first_image"],
        altNames: List<AltName>.from(
            json["alt_names"].map((x) => AltName.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "meaning": meaning,
        "image_context_description": imageContextDescription,
        "probability": probability,
        "keywords": List<dynamic>.from(keywords!.map((x) => x.toJson())),
        "attribute_values":
            List<dynamic>.from(attributeValues!.map((x) => x.toJson())),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "first_image": firstImage,
        "alt_names": List<dynamic>.from(altNames!.map((x) => x.toJson())),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted": deleted,
      };
}

class AltName {
  AltName({
    required this.id,
    required this.name,
    required this.deleted,
  });

  int id;
  String name;
  dynamic deleted;

  factory AltName.fromJson(Map<String, dynamic> json) => AltName(
        id: json["id"],
        name: json["name"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted": deleted,
      };
}

class AttributeValue {
  AttributeValue({
    required this.id,
    required this.name,
    required this.weight,
  });

  int id;
  String name;
  int weight;

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
        id: json["id"],
        name: json["name"],
        weight: json["weight"] == null ? null : json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "weight": weight == null ? null : weight,
      };
}

class Image {
  Image({
    required this.id,
    required this.url,
    required this.title,
    this.relatedSymbols,
    this.thumbnails,
  });

  int id;
  String url;
  String title;
  List<RelatedSymbol>? relatedSymbols;
  List<Thumbnail>? thumbnails;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        relatedSymbols: List<RelatedSymbol>.from(
            json["related_symbols"].map((x) => RelatedSymbol.fromJson(x))),
        thumbnails: List<Thumbnail>.from(
            json["thumbnails"].map((x) => Thumbnail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "related_symbols":
            List<dynamic>.from(relatedSymbols!.map((x) => x.toJson())),
        "thumbnails": List<dynamic>.from(thumbnails!.map((x) => x.toJson())),
      };
}

class RelatedSymbol {
  RelatedSymbol({
    required this.id,
    required this.name,
    required this.meaning,
  });

  int id;
  String name;
  String meaning;

  factory RelatedSymbol.fromJson(Map<String, dynamic> json) => RelatedSymbol(
        id: json["id"],
        name: json["name"],
        meaning: json["meaning"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "meaning": meaning,
      };
}

class Thumbnail {
  Thumbnail({
    required this.id,
    required this.url,
    required this.assetPath,
    required this.storagePath,
    required this.image,
  });

  int id;
  String url;
  String assetPath;
  String storagePath;
  int image;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        id: json["id"],
        url: json["url"],
        assetPath: json["asset_path"],
        storagePath: json["storage_path"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "asset_path": assetPath,
        "storage_path": storagePath,
        "image": image,
      };
}

class Keyword {
  Keyword({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Keyword.fromJson(Map<String, dynamic> json) => Keyword(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
