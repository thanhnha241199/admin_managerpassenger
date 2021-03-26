// To parse this JSON data, do
//
//     final discount = discountFromJson(jsonString);

import 'dart:convert';

Discount discountFromJson(String str) => Discount.fromJson(json.decode(str));

String discountToJson(Discount data) => json.encode(data.toJson());

class Discount {
  Discount({
    this.id,
    this.title,
    this.sale,
    this.timestart,
    this.timeend,
    this.code,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String title;
  int sale;
  DateTime timestart;
  DateTime timeend;
  String code;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        id: json["_id"],
        title: json["title"],
        sale: json["sale"],
        timestart: DateTime.parse(json["timestart"]),
        timeend: DateTime.parse(json["timeend"]),
        code: json["code"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "sale": sale,
        "timestart": timestart.toIso8601String(),
        "timeend": timeend.toIso8601String(),
        "code": code,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
