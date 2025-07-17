import 'dart:convert';

import 'package:get/get.dart';
import 'package:getfireapp/app/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  final String apiUrl = 'https://fakestoreapi.com/products';
  Future<List<Productmodel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data
          .map((productjson) => Productmodel.fromJson(productjson))
          .toList();
    } else {
      throw Exception('failed');
    }
  }
}
