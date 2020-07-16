import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.id,
        this.description,
        this.imageUrl,
        this.name,
    });

    String id;
    String description;
    String imageUrl;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        description: json["description"],
        imageUrl: json["image_url"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "image_url": imageUrl,
        "name": name,
    };
}
