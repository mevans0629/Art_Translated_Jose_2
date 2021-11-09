import 'dart:convert';

Suggests suggestFromJson(String str) => Suggests.fromJson(json.decode(str));

String suggestToJson(Suggests data) => json.encode(data.toJson());

class Suggests {
  Suggests({
    this.data,
  });

  List<String>? data;

  factory Suggests.fromJson(Map<String, dynamic> json) => Suggests(
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
