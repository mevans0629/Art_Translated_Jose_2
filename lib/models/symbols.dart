import 'dart:convert';

Symbols symbolsFromJson(String str) => Symbols.fromJson(json.decode(str));

String symbolsToJson(Symbols data) => json.encode(data.toJson());

class Symbols {
  Symbols({
    this.count,
    this.next,
    this.previous,
    this.facets,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  Facets? facets;
  List<Symbol>? results;

  factory Symbols.fromJson(Map<String, dynamic> json) => Symbols(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        facets: Facets.fromJson(json["facets"]),
        results: List<Symbol>.from(
            json["results"].map((x) => x == null ? null : Symbol.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "facets": facets!.toJson(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Facets {
  Facets();

  factory Facets.fromJson(Map<String, dynamic> json) => Facets();

  Map<String, dynamic> toJson() => {};
}

class Symbol {
  Symbol({
    required this.id,
    required this.name,
    required this.meaning,
    this.description,
    this.alternatives,
    this.images,
    this.probability,
  });

  double id;
  String name;
  String meaning;
  String? description;
  List<String>? alternatives;
  List<String>? images;
  int? probability;

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        id: json["id"].toDouble(),
        name: json["name"],
        meaning: json["meaning"],
        description: json["description"],
        alternatives: List<String>.from(json["alternatives"].map((x) => x)),
        images:
            List<String>.from(json["images"]!.map((x) => x == null ? "" : x)),
        probability: json["probability"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "meaning": meaning,
        "description": description,
        "alternatives": List<dynamic>.from(alternatives!.map((x) => x)),
        "images": List<dynamic>.from(images!.map((x) => x == null ? null : x)),
        "probability": probability,
      };
}
