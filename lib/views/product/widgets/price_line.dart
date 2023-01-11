import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wothoq_task/misc/theme.dart';

import 'package:wothoq_task/models/product.dart';

class PriceLine extends StatelessWidget {
  final Product product;
  const PriceLine({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.salePrice == 0 || product.salePrice == product.regularPrice) {
      return AutoSizeText(
        "${product.regularPrice} SAR",
        style: const TextStyle(fontSize: 20),
        maxLines: 2,
      );
    }
    return Row(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              AutoSizeText(
                "${product.salePrice} SAR",
                style: const TextStyle(fontSize: 20),
                maxLines: 2,
              ),
              const SizedBox(width: 5),
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${product.regularPrice} SAR",
                      style: TextStyle(
                        fontSize: 15,
                        color: ThemeManager().metalic,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: " ${product.regularPrice.toString()}%",
                      style: const TextStyle(
                        color: Colors.orange,
                        decoration: null,
                      ),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
