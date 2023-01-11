import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wothoq_task/controllers/products_controller.dart';
import 'package:wothoq_task/misc/theme.dart';
import 'package:wothoq_task/models/product.dart';
import 'package:wothoq_task/views/product/widgets/cart_button.dart';
import 'package:wothoq_task/views/product/widgets/details_tabbar.dart';
import 'package:wothoq_task/views/product/widgets/price_line.dart';
import 'package:wothoq_task/views/product/widgets/product_details.dart';
import 'package:wothoq_task/views/product/widgets/product_reviews.dart';
import 'package:wothoq_task/views/product/widgets/sliver_photo_slider.dart';
import 'package:wothoq_task/views/product/widgets/store_tile.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ProductViewState createState() => ProductViewState();
}

class ProductViewState extends ConsumerState<ProductView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<Product> productWatch = ref.watch(productProvider);
    return productWatch.when(
      data: (Product product) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const CartButton(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPhotoSlider(
                  product: product,
                ),
              ];
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 5,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        product.name,
                        style: const TextStyle(fontSize: 20),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      PriceLine(product: product),
                      Divider(
                        thickness: 1,
                        color: ThemeManager().metalic,
                      ),
                      StoreTile(product: product),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    product.desc,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        DetailsTabbar(tabController: _tabController),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ProductDetails(product: product),
                              ProductReviews(product: product)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        log("Erro", error: error, stackTrace: stackTrace);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 40),
              const SizedBox(height: 10),
              Text(
                "error fetching data".tr,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      },
      loading: () {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Text(
                "fetching data".tr,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      },
    );
  }
}
