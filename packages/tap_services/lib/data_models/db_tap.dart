import 'package:flutter/cupertino.dart';

class DBTap {
  int id;
  String title;
  String description;

  DBTap({
    this.id = 0,
    this.title = '',
    this.description = '',
  });

  factory DBTap.fromMap(Map<String, dynamic> json) => DBTap(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        description: json['description'] ?? '',
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
