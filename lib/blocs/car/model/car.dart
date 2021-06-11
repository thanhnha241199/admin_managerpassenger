// To parse this JSON data, do
//
//     final car = carFromJson(jsonString);

import 'dart:convert';

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  Car({
    this.id,
    this.name,
    this.driverid,
    this.supportid,
    this.numberplate,
    this.tourid,
    this.status,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String name;
  String driverid;
  String supportid;
  String numberplate;
  String tourid;
  String status;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["_id"],
        name: json["name"],
        driverid: json["driverid"],
        supportid: json["supportid"],
        numberplate: json["numberplate"],
        tourid: json["tourid"],
        status: json["status"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "driverid": driverid,
        "supportid": supportid,
        "numberplate": numberplate,
        "tourid": tourid,
        "status": status,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
