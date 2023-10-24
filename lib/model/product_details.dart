// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
    final int id;
    final String title;
    final int price;
    final String description;
    final Category category;
    final List<String> images;

    ProductDetailsModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.images,
    });

    factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class Category {
    final int id;
    final String name;
    final String image;

    Category({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
