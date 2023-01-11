import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wothoq_task/controllers/products_controller.dart';
import 'package:wothoq_task/misc/paths.dart';
import 'package:wothoq_task/misc/theme.dart';

class CartButton extends HookConsumerWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef widgerRef) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ThemeManager().darkGrey,
                  ),
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          widgerRef.read(productController).decrementCount();
                        },
                        icon: Icon(
                          Icons.remove,
                          color: ThemeManager().darkGrey,
                        ),
                      ),
                    ),
                    HookConsumer(
                      builder: (context, ref, widget) {
                        final int count = ref.watch(productController
                            .select((value) => value.itemCount));
                        return Text(
                          count.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        );
                      },
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          widgerRef.read(productController).incrementCount();
                        },
                        icon: Icon(
                          Icons.add,
                          color: ThemeManager().darkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await widgerRef.read(productController).addToCart();
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Transform.scale(
                        scaleX: Get.locale?.languageCode == "ar" ? -1 : 1,
                        child: Material(
                          elevation: 18.0,
                          color: Colors.transparent,
                          child: SvgPicture.asset(
                            PathsManager.cartButton,
                            height: 60,
                          ),
                        ),
                      ),
                      Text(
                        "add to cart".tr,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
