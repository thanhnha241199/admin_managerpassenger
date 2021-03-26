import 'dart:convert';

UserAccount userAccountFromJson(String str) => UserAccount.fromJson(json.decode(str));

String userAccountToJson(UserAccount data) => json.encode(data.toJson());

class UserAccount {
  UserAccount({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  String id;
  String email;
  String name;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  String type;

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "phone": phone,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "type": type,
  };
}
