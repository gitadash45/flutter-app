import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_chepter_1/app/routes/app_routes.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toString()}'),
                    trailing: IconButton(
                      onPressed: () {
                        cartController.removeCart(item);
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(() {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '\$${cartController.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.CHECKOUT);
            },
            child: Text('Go to check Out page!'),
          ),
        ],
      ),
    );
  }
}
