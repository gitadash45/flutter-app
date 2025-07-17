import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  final String apiUrl = 'https://fakestoreapi.com/products';
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data
          .map((productjson) => ProductModel.fromJson(productjson))
          .toList();
    } else {
      throw Exception('failed');
    }
  }
}
