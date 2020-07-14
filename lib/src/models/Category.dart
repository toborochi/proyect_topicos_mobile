import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.id,
        this.description,
        this.name,
    });

    String id;
    String description;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        description: json["description"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "name": name,
    };
}
