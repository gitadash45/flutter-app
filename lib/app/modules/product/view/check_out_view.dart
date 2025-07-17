import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/controllers/cart_controller.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Out')),
      body: Center(
        child: Column(
          children: [
            Text('Thank you for purchase!', style: TextStyle(fontSize: 35)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final CartController cartController =
                    Get.find<CartController>();

                cartController.caetServices.clearCart();
                Get.offAllNamed('/product');
              },
              child: Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
