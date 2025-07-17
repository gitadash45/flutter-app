import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_chepter_1/app/modules/product/model/product_model.dart';

class CaetServices extends GetxService {
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("INIT CSRT SERVICE");
    List? storedCart = storage.read<List>('cartItems');
    if (storedCart != null) {
      cartItems.assignAll(
        storedCart.map((e) => ProductModel.fromJson(e)).toList(),
      );
    }

    ever(cartItems, (_) {
      storage.write('cartItems', cartItems.map((e) => e.toJson()).toList());
    });
  }

  void addToCart(ProductModel products) {
    cartItems.add(products);
  }

  void removeCart(ProductModel products) {
    cartItems.remove(products);
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalAmount {
    return cartItems.fold(0, (sum, amount) => sum + amount.price);
  }
}
