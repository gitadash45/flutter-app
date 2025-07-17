import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_chepter_1/app/services/caet_services.dart';

class Cartbinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(CartController());

    Get.lazyPut<CartController>(() => CartController());
    // TODO: implement dependencies
  }
}
