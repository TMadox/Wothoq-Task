import 'package:wothoq_task/models/product.dart';
import 'package:wothoq_task/services/dio_service.dart';

class ProductsRepo {
  Future<Product> fetchProductDetais() async {
    final response =
        await DioService.to.get("/1243be15-efd5-4132-9bd0-eeb33f325f51");
    return Product.fromMap(response);
  }
}
