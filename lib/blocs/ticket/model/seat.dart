// To parse this JSON data, do
//
//     final seat = seatFromJson(jsonString);

import 'dart:convert';

Seat seatFromJson(String str) => Seat.fromJson(json.decode(str));

String seatToJson(Seat data) => json.encode(data.toJson());

class Seat {
  Seat({
    this.floors1,
    this.floors2,
    this.id,
    this.idtour,
    this.idcar,
    this.createdAt,
    this.updatedAt,
  });

  List<String> floors1;
  List<String> floors2;
  String id;
  String idtour;
  String idcar;
  DateTime createdAt;
  DateTime updatedAt;

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        floors1: List<String>.from(json["floors1"].map((x) => x)),
        floors2: List<String>.from(json["floors2"].map((x) => x)),
        id: json["_id"],
        idtour: json["idtour"],
        idcar: json["idcar"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "floors1": List<dynamic>.from(floors1.map((x) => x)),
        "floors2": List<dynamic>.from(floors2.map((x) => x)),
        "_id": id,
        "idtour": idtour,
        "idcar": idcar,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
