import 'dart:convert';

import 'package:art_translated/models/datum.dart';
import 'package:art_translated/models/image.dart';

SymbolRes responseFromJson(String str) => SymbolRes.fromJson(json.decode(str));

class SymbolRes {
  SymbolRes({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory SymbolRes.fromJson(Map<String, dynamic> json) => SymbolRes(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

SymbolImageRes welcomeFromJson(String str) =>
    SymbolImageRes.fromJson(json.decode(str));

class SymbolImageRes {
  SymbolImageRes({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Image> data;

  factory SymbolImageRes.fromJson(Map<String, dynamic> json) => SymbolImageRes(
        success: json["success"],
        message: json["message"],
        data: List<Image>.from(json["data"].map((x) => Image.fromJson(x))),
      );
}
