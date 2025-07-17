import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_chepter_1/app/modules/product/controllers/product_controller.dart';
import 'package:getx_chepter_1/app/services/caet_services.dart';
import 'package:getx_chepter_1/app/services/product_services.dart';

class Productbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductServices>(() => ProductServices());
    Get.lazyPut<ProductController>(
      () => ProductController(productServices: Get.find<ProductServices>()),
    );
    // TODO: implement dependencies
  }
}
