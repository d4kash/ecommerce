// To parse this JSON data, do
//
//     final productCategoryModel = productCategoryModelFromJson(jsonString);

import 'dart:convert';

List<ProductCategoryModel> productCategoryModelFromJson(String str) => List<ProductCategoryModel>.from(json.decode(str).map((x) => ProductCategoryModel.fromJson(x)));

String productCategoryModelToJson(List<ProductCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategoryModel {
    final int id;
    final String name;
    final String image;

    ProductCategoryModel({
        required this.id,
        required this.name,
        required this.image,
    });

    factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => ProductCategoryModel(
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
