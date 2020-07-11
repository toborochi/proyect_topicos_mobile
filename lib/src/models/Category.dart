import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.description,
    this.name,
  });

  String description;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description : json["description"],
      name        : json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description" : description,
      "name"        : name,
    };
  }
}
