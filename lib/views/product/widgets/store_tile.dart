import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:wothoq_task/misc/screen.dart';
import 'package:wothoq_task/misc/theme.dart';
import 'package:wothoq_task/models/product.dart';

class StoreTile extends StatelessWidget {
  final Product product;
  const StoreTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(30), // Image radius
          child: FancyShimmerImage(
            imageUrl: product.store.logo ,
            boxFit: BoxFit.cover,
            errorWidget: Image.network(
              "https://picsum.photos/${screenWidth(context).toInt()}/300",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        product.store.name ,
        style: const TextStyle(fontSize: 22),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.orange,
                  size: 28,
                ),
                Text(
                  product.store.fullAddress,
                  style: TextStyle(
                    fontSize: 18,
                    color: ThemeManager().metalic,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
