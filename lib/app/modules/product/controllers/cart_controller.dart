import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/model/product_model.dart';
import 'package:getx_chepter_1/app/services/caet_services.dart';

class CartController extends GetxController {
  final CaetServices caetServices = Get.find<CaetServices>();

  List<ProductModel> get cartItems => caetServices.cartItems;

  double get totalAmount => caetServices.totalAmount;

  void addToCart(ProductModel product) {
    caetServices.addToCart(product);
  }

  void removeCart(ProductModel product) {
    caetServices.removeCart(product);
  }
}
