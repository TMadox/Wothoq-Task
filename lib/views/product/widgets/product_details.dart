import 'package:flutter/material.dart';
import 'package:wothoq_task/misc/theme.dart';
import 'package:wothoq_task/models/product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (product.productDetails).length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: (index % 2) == 0 ? null : ThemeManager().baleWhite,
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: ListTile(
            selected: false,
            contentPadding: EdgeInsets.zero,
            title: Text(
              product.productDetails[index].toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing: Text(
              product.productDetails[index].value.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
