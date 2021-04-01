// To parse this JSON data, do
//
//     final ticketOrder = ticketOrderFromJson(jsonString);

import 'dart:convert';

TicketOrder ticketOrderFromJson(String str) =>
    TicketOrder.fromJson(json.decode(str));

String ticketOrderToJson(TicketOrder data) => json.encode(data.toJson());

class TicketOrder {
  TicketOrder({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.tour,
    this.timetour,
    this.quantity,
    this.seat,
    this.price,
    this.totalprice,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String uid;
  String name;
  String email;
  String tour;
  String timetour;
  String quantity;
  String seat;
  String price;
  String totalprice;
  DateTime createdAt;
  DateTime updatedAt;

  factory TicketOrder.fromJson(Map<String, dynamic> json) => TicketOrder(
        id: json["_id"],
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        tour: json["tour"],
        timetour: json["timetour"],
        quantity: json["quantity"],
        seat: json["seat"],
        price: json["price"],
        totalprice: json["totalprice"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "name": name,
        "email": email,
        "tour": tour,
        "timetour": timetour,
        "quantity": quantity,
        "seat": seat,
        "price": price,
        "totalprice": totalprice,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
