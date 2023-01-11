import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wothoq_task/models/product.dart';
import 'package:wothoq_task/services/repositories/products_repo.dart';

final productProvider = FutureProvider<Product>(
  (ref) async {
    final Product product = await ProductsRepo().fetchProductDetais();
    return product;
  },
);
final productController =
    ChangeNotifierProvider<ProductsController>((ref) => ProductsController());

class ProductsController extends ChangeNotifier {
  int _sliderPosition = 0;
  int _itemCount = 0;
  bool _isFavorite = false;
  int get sliderPosition => _sliderPosition;
  int get itemCount => _itemCount;
  bool get favorite => _isFavorite;

  void setFavorite({bool? input}) {
    if (input != null) {
      _isFavorite = input;
    } else {
      _isFavorite = !favorite;
    }
    notifyListeners();
  }

  void incrementCount() {
    _itemCount++;
    notifyListeners();
  }

  void decrementCount() {
    if (_itemCount > 0) {
      _itemCount--;
    }
    notifyListeners();
  }

  void onSliderChange(int index) {
    _sliderPosition = index;
    notifyListeners();
  }

  Future<void> addToCart() async {
    try {
      EasyLoading.show();
      await Future.delayed(const Duration(seconds: 2));
      bool error = Random().nextBool();
      if (error) {
        throw "fake error";
      }
      EasyLoading.showSuccess("product added to cart successfully".tr);
    } catch (e) {
      EasyLoading.showError("unknown error occured, please try again".tr);
    }
  }

  Future<void> updateLocale() async {
    try {
      EasyLoading.show();
      if (Get.locale!.languageCode == "ar") {
        Get.updateLocale(const Locale("en"));
        GetStorage().write("language", "en");
      } else {
        Get.updateLocale(const Locale("ar"));
        GetStorage().write("language", "ar");
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError("error changing language".tr);
    }
  }
}
