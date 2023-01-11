import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wothoq_task/controllers/products_controller.dart';
import 'package:wothoq_task/misc/screen.dart';
import 'package:wothoq_task/misc/theme.dart';
import 'package:wothoq_task/models/product.dart';

class SliverPhotoSlider extends HookConsumerWidget {
  final Product product;
  const SliverPhotoSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context, ref) {
    return SliverAppBar(
      expandedHeight: 300,
      elevation: 0,
      titleSpacing: 0,
      toolbarHeight: 70,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
              top: 2,
              bottom: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: Get.locale?.languageCode == "ar"
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () async {
                      await ref.read(productController).updateLocale();
                    },
                    icon: Icon(
                      Icons.language,
                      color: ThemeManager().darkGrey,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Share.share(
                          "${"check out this cool product".tr} ${product.name}");
                    },
                    icon: Icon(
                      Icons.share,
                      color: ThemeManager().darkGrey,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      ref.read(productController).setFavorite();
                    },
                    icon: HookConsumer(
                      builder: (context, ref, widget) {
                        final bool isFavorite = ref.watch(productController
                            .select((value) => value.favorite));
                        return Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color:
                              isFavorite ? Colors.red : ThemeManager().darkGrey,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      pinned: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          height: 20,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            ImageSlideshow(
              onPageChanged: (index) {
                ref.read(productController).onSliderChange(index);
              },
              indicatorColor: Colors.transparent,
              indicatorRadius: 0,
              children: (product.images)
                  .map(
                    (image) => FancyShimmerImage(
                      imageUrl: image.img,
                      boxFit: BoxFit.cover,
                      errorWidget: CachedNetworkImage(
                        imageUrl:
                            "https://picsum.photos/${screenWidth(context).toInt()}/300",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: HookConsumer(
                builder: (context, ref, state) {
                  int sliderPosition = ref.watch(productController
                      .select((provider) => provider.sliderPosition));
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SmoothIndicator(
                      offset: sliderPosition.toDouble(),
                      count: product.images.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.white,
                        activeDotColor: Colors.orange,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
