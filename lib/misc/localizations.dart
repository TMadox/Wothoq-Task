import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationManager extends Translations {
  static final List<Locale> locales = [
    const Locale('en'),
    const Locale('ar'),
  ];
  @override
  Map<String, Map<String, String>> get keys => {'en': english, 'ar': arabic};

  final Map<String, String> arabic = {
    "product details": "تفاصيل المنتج",
    "add to cart": "اضف الي العربة",
    "product review": "مراجعات المنتج",
    "quantity": "ألكمية",
    "size": "ألحجم",
    "width": "ألعرض",
    "height": "ألطول",
    "weight": "ألوزن",
    "type": "ألنوع",
    "gender": "الجنس",
    "check out this cool product": "تفقد هذا المنتج الرائع",
    "product added to cart successfully": "تم اضافة المنتج بنجاح",
    "unknown error occured, please try again": "حدث خطا ما, حاول مجددا",
  };
  final Map<String, String> english = {
    "product details": "Product Details",
    "add to cart": "Add To Cart",
    "product review": "Product Review",
    "quantity": "Quantity",
    "size": "Size",
    "width": "Width",
    "height": "Height",
    "weight": "Weight",
    "type": "Type",
    "gender": "Gender",
    "check out this cool product": "Check out this cool product",
    "product added to cart successfully": "Product added to cart sucessfully!",
    "unknown error occured, please try again":
        "Unkown erro occured, please try again",
  };
}
