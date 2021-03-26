import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    this.id,
    this.idtour,
    this.locationstart,
    this.locationend,
    this.createdAt,
    this.updatedAt,
    this.schedule,
  });

  String id;
  String idtour;
  String locationstart;
  String locationend;
  DateTime createdAt;
  DateTime updatedAt;
  List<ScheduleElement> schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["_id"],
        idtour: json["idtour"],
        locationstart: json["locationstart"],
        locationend: json["locationend"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        schedule: List<ScheduleElement>.from(
            json["schedule"].map((x) => ScheduleElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idtour": idtour,
        "locationstart": locationstart,
        "locationend": locationend,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
      };
}

ScheduleElement scheduleElementFromJson(String str) => ScheduleElement.fromJson(json.decode(str));

String scheduleElementToJson(ScheduleElement data) => json.encode(data.toJson());

class ScheduleElement {
  ScheduleElement({
    this.location,
    this.time,
    this.address,
  });

  String location;
  String time;
  String address;

  factory ScheduleElement.fromJson(Map<String, dynamic> json) =>
      ScheduleElement(
        location: json["location"],
        time: json["time"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "time": time,
        "address": address,
      };
}
