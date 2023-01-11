import 'package:get/get.dart';

class ProductDetail {
  ProductDetail({
    required this.id,
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  final int id;
  final String value;
  final String nameAr;
  final String nameEn;

  ProductDetail copyWith({
    int? id,
    String? value,
    String? nameAr,
    String? nameEn,
  }) =>
      ProductDetail(
        id: id ?? this.id,
        value: value ?? this.value,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
      );

  factory ProductDetail.fromMap(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        value: json["value"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
        "name_ar": nameAr,
        "name_en": nameEn,
      };
  @override
  String toString() {
    if (Get.locale!.languageCode == "ar") {
      return nameAr;
    } else {
      return nameEn;
    }
  }
}
