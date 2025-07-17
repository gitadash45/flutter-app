import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import 'package:get/get.dart';
import 'package:getfireapp/app/model/productmodel.dart';
import 'package:getfireapp/constants/dimentions.dart';
import 'package:getfireapp/constants/statictext.dart';

import '../controllers/productdetails_controller.dart';

class ProductdetailsView extends GetView<ProductdetailsController> {
  ProductdetailsView({super.key});
  final Productmodel products = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Statictext.PRODUCTDETAIL),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(products.image!, height: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products.title!, style: TextStyle(fontSize: 20)),
                SizedBox(height: Dimentions.HEIGHT10),
                Text('Description : \n${products.description!}'),
                SizedBox(height: Dimentions.HEIGHT20),
                Text(
                  'price :\$${products.price}',
                  style: TextStyle(fontSize: 18),
                ),
                StarRating(
                  rating: products.rating!.rate!,
                  starCount: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
