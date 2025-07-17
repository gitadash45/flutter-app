import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/controllers/product_controller.dart';
import 'package:getx_chepter_1/app/services/themeservices.dart';

class ProductView extends GetView<ProductController> {
  // final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product_list'.tr),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.locale == Locale('en', 'US')) {
                print('object');
                Get.updateLocale(Locale('es', 'ES'));
              } else {
                Get.updateLocale(Locale('en', 'US'));
              }
            },
            icon: Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {
              Themeservices().switchTheme();
            },
            icon: Icon(Icons.brightness_1),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.errormsg.isNotEmpty) {
          return Center(child: Text(controller.errormsg.value));
        }
        return ListView.builder(
          itemCount: controller.productsList.length,
          itemBuilder: (context, index) {
            final product = controller.productsList[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text(product.price.toString()),
              onTap: () {
                Get.toNamed('/product-details', arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
