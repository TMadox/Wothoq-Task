import 'dart:convert';
import 'package:wothoq_task/models/image.dart';
import 'package:wothoq_task/models/product_details.dart';
import 'package:wothoq_task/models/review.dart';
import 'package:wothoq_task/models/store.dart';

Product? productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product? data) => json.encode(data!.toMap());

class Product {
  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.stock,
    required this.isFavourite,
    required this.rate,
    required this.numUsersRate,
    required this.images,
    required this.reviews,
    required this.productDetails,
    required this.store,
  });

  final int id;
  final String name;
  final String desc;
  final int regularPrice;
  final int salePrice;
  final bool onSale;
  final int stock;
  final bool isFavourite;
  final int rate;
  final int numUsersRate;
  final List<Image> images;
  final List<Review> reviews;
  final List<ProductDetail> productDetails;
  final Store store;

  Product copyWith({
    int? id,
    String? name,
    String? desc,
    int? regularPrice,
    int? salePrice,
    bool? onSale,
    int? stock,
    bool? isFavourite,
    int? rate,
    int? numUsersRate,
    List<Image>? images,
    List<Review>? reviews,
    List<ProductDetail>? productDetails,
    Store? store,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        regularPrice: regularPrice ?? this.regularPrice,
        salePrice: salePrice ?? this.salePrice,
        onSale: onSale ?? this.onSale,
        stock: stock ?? this.stock,
        isFavourite: isFavourite ?? this.isFavourite,
        rate: rate ?? this.rate,
        numUsersRate: numUsersRate ?? this.numUsersRate,
        images: images ?? this.images,
        reviews: reviews ?? this.reviews,
        productDetails: productDetails ?? this.productDetails,
        store: store ?? this.store,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"] ?? "",
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"] ?? 0,
        onSale: json["on_sale"] ?? false,
        stock: json["stock"],
        isFavourite: json["is_favourite"] ?? false,
        rate: json["rate"] ?? 0,
        numUsersRate: json["num_users_rate"] ?? 0,
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(json["reviews"].map((x) => Review.fromMap(x))),
        productDetails: json["product_details"] == null
            ? []
            : List<ProductDetail>.from(
                json["product_details"].map((x) => ProductDetail.fromMap(x))),
        store: Store.fromMap(json["store"] ?? {}),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "on_sale": onSale,
        "stock": stock,
        "is_favourite": isFavourite,
        "rate": rate,
        "num_users_rate": numUsersRate,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
        "product_details":
            List<dynamic>.from(productDetails.map((x) => x.toMap())),
        "store": store,
      };
}
