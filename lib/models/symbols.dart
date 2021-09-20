import 'dart:convert';

Symbols symbolsFromJson(String str) => Symbols.fromJson(json.decode(str));

String symbolsToJson(Symbols data) => json.encode(data.toJson());

class Symbols {
  Symbols({
    required this.count,
    this.next,
    this.previous,
    required this.symbols,
  });

  int count;
  String? next;
  dynamic? previous;
  List<Symbol> symbols;

  factory Symbols.fromJson(Map<String, dynamic> json) => Symbols(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        symbols:
            List<Symbol>.from(json["results"].map((x) => Symbol.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "symbols": List<dynamic>.from(symbols.map((x) => x.toJson())),
      };
}

class Symbol {
  Symbol({
    required this.id,
    required this.name,
    required this.meaning,
    required this.imageContextDescription,
    required this.probability,
    required this.firstImage,
    required this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  int id;
  String name;
  String meaning;
  String imageContextDescription;
  int probability;
  dynamic firstImage;
  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? deleted;

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        id: json["id"],
        name: json["name"],
        meaning: json["meaning"],
        imageContextDescription: json["image_context_description"],
        probability: json["probability"],
        firstImage: json["first_image"],
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
        "first_image": firstImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted": deleted,
      };
}
