import 'dart:convert';

List<Getapi> getapiFromJson(String str) =>
    List<Getapi>.from(json.decode(str).map((x) => Getapi.fromJson(x)));

String getapiToJson(List<Getapi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getapi {
  Getapi({
    this.title,
    this.description,
    this.category,
    this.timestamp,
    this.priority,
    this.userId,
    this.isCompleted,
    this.id,
  });

  String? title;
  String? description;
  String? category;
  String? timestamp;
  String? priority;
  String? userId;
  String? isCompleted;
  String? id;

  factory Getapi.fromJson(Map<String, dynamic> json) => Getapi(
        title: json["title"],
        description: json["description"],
        category: json["category"],
        timestamp: json["timestamp"],
        priority: json["priority"],
        userId: json["user_id"],
        isCompleted: json["isCompleted"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "category": category,
        "timestamp": timestamp,
        "priority": priority,
        "user_id": userId,
        "isCompleted": isCompleted,
        "id": id,
      };
}
