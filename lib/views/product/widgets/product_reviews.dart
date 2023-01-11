import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wothoq_task/misc/theme.dart';
import 'package:wothoq_task/models/product.dart';

class ProductReviews extends StatelessWidget {
  final Product product;
  const ProductReviews({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: product.productDetails.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AutoSizeText(
                      product.reviews[index].userName,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const Spacer(),
                  RatingBar(
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                      ),
                      empty: const Icon(
                        Icons.star_border,
                        color: Colors.amber,
                      ),
                    ),
                    onRatingUpdate: (v) {},
                    itemSize: 20,
                    initialRating: product.rate.toDouble(),
                    ignoreGestures: true,
                    updateOnDrag: false,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                product.reviews[index].review.toString(),
              ),
              const SizedBox(height: 10),
              Text(
                product.reviews[index].createdAt.toString(),
                style: TextStyle(
                  color: ThemeManager().metalic,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          indent: 25,
          endIndent: 25,
          thickness: 1,
          height: 0,
          color: ThemeManager().metalic,
        );
      },
    );
  }
}
