import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
  Ticket({
    this.id,
    this.locationstart,
    this.locationend,
    this.time,
    this.range,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String locationstart;
  String locationend;
  String time;
  String range;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["_id"],
    locationstart: json["locationstart"],
    locationend: json["locationend"],
    time: json["time"],
    range: json["range"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "locationstart": locationstart,
    "locationend": locationend,
    "time": time,
    "range": range,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
