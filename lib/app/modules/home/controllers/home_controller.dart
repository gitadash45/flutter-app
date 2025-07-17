import 'package:get/get.dart';
import 'package:getfireapp/app/model/productmodel.dart';
import 'package:getfireapp/app/services/api.dart';
import 'package:getfireapp/app/services/auth.dart';

class HomeController extends GetxController {
  var productList = <Productmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var products = await ProductServices().fetchProducts();
    productList.addAll(products);
  }
}
