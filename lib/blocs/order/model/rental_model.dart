// To parse this JSON data, do
//
//     final rentalOrder = rentalOrderFromJson(jsonString);

import 'dart:convert';

RentalOrder rentalOrderFromJson(String str) =>
    RentalOrder.fromJson(json.decode(str));

String rentalOrderToJson(RentalOrder data) => json.encode(data.toJson());

class RentalOrder {
  RentalOrder({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.timestart,
    this.timeend,
    this.phone,
    this.note,
    this.type,
    this.quantityseat,
    this.typecar,
    this.seatcar,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String uid;
  String name;
  String email;
  DateTime timestart;
  DateTime timeend;
  String phone;
  String note;
  String type;
  String quantityseat;
  String typecar;
  String seatcar;
  DateTime createdAt;
  DateTime updatedAt;

  factory RentalOrder.fromJson(Map<String, dynamic> json) => RentalOrder(
        id: json["_id"],
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        timestart: DateTime.parse(json["timestart"]),
        timeend: DateTime.parse(json["timeend"]),
        phone: json["phone"],
        note: json["note"],
        type: json["type"],
        quantityseat: json["quantityseat"],
        typecar: json["typecar"],
        seatcar: json["seatcar"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "name": name,
        "email": email,
        "timestart": timestart.toIso8601String(),
        "timeend": timeend.toIso8601String(),
        "phone": phone,
        "note": note,
        "type": type,
        "quantityseat": quantityseat,
        "typecar": typecar,
        "seatcar": seatcar,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
