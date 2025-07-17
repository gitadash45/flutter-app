import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_chepter_1/app/modules/product/model/product_model.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel products = Get.arguments;
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            Text(products.title, style: TextStyle(fontSize: 35)),
            SizedBox(height: 10),
            Text(
              '\$${products.price.toString()}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(products);
                Get.snackbar('item Added', 'You can check in cart');
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
