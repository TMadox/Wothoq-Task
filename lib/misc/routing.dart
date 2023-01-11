import 'package:get/get.dart';
import 'package:wothoq_task/views/product/product_view.dart';

class RoutingManager {
   static String productScreen = "/";
 static  List<GetPage> routes = [
    GetPage(name: "/", page: () => const ProductView()),
  ];
}
