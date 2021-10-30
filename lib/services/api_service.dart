import 'package:dio/dio.dart';
import 'package:flutter_interview_test/models/product_model.dart';

class DioClient {
  final Dio _dio = Dio();

  getProducts() async {
    String _baseUrl =
        "https://59b8726e92ccc3eb44b0c193eeef96f6.m.pipedream.net/products";

    Response response = await _dio.post(_baseUrl);

    if (response.statusCode == 200) {
      var productData = response.data;

      List<Product> productList =
          productData.map<Product>((j) => Product.fromJson(j)).toList();

      return productList;
    }
  }
}
