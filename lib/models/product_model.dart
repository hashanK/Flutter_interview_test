import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<Product>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.images,
  });

  String id;
  String title;
  String price;
  double rating;
  String description;
  String images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        rating: json["rating"].toDouble(),
        description: json["description"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "rating": rating,
        "description": description,
        "images": images,
      };
}
