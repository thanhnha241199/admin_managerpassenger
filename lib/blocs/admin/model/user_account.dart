// To parse this JSON data, do
//
//     final userAccount = userAccountFromJson(jsonString);

import 'dart:convert';

UserAccount userAccountFromJson(String str) =>
    UserAccount.fromJson(json.decode(str));

String userAccountToJson(UserAccount data) => json.encode(data.toJson());

class UserAccount {
  UserAccount({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.active,
    this.image,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.review,
  });

  String id;
  String email;
  String password;
  String name;
  String phone;
  String active;
  String image;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  String token;
  List<Review> review;

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        phone: json["phone"],
        active: json["active"],
        image: json["image"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        token: json["token"],
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "active": active,
        "image": image,
        "type": type,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "token": token,
        "review": List<dynamic>.from(review.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    this.id,
    this.rating,
    this.description,
  });

  String id;
  String rating;
  String description;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        rating: json["rating"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rating": rating,
        "description": description,
      };
}
