// To parse this JSON data, do
//
//     final productsEntry = productsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductsEntry> productsEntryFromJson(String str) => List<ProductsEntry>.from(json.decode(str).map((x) => ProductsEntry.fromJson(x)));

String productsEntryToJson(List<ProductsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsEntry {
  int id;
  String name;
  int price;
  String description;
  String category;
  String thumbnail;
  int productsSolds;
  int stock;
  bool isFeatured;
  int userId;

  ProductsEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.productsSolds,
    required this.stock,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    thumbnail: json["thumbnail"] ?? "",
    productsSolds: json["products_solds"],
    stock: json["stock"],
    isFeatured: json["is_featured"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "category": category,
    "thumbnail": thumbnail,
    "products_solds": productsSolds,
    "stock": stock,
    "is_featured": isFeatured,
    "user_id": userId,
  };
}
