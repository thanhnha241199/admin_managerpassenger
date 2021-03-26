// To parse this JSON data, do
//
//     final car = carFromJson(jsonString);

import 'dart:convert';

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  Car({
    this.id,
    this.driverid,
    this.supportid,
    this.tourid,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String driverid;
  String supportid;
  String tourid;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["_id"],
        driverid: json["driverid"],
        supportid: json["supportid"],
        tourid: json["tourid"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "driverid": driverid,
        "supportid": supportid,
        "tourid": tourid,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
