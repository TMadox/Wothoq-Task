import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailsTabbar extends StatelessWidget {
  final TabController tabController;
  const DetailsTabbar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TabBar(
        controller: tabController,
        labelColor: Colors.orange,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.orange,
        indicatorWeight: 3,
        tabs: [
          Tab(text: 'product details'.tr),
          Tab(text: 'product review'.tr),
        ],
      ),
    );
  }
}
