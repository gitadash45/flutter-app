import 'package:get/get.dart';
import 'package:getx_chepter_1/app/binding/CartBinding.dart';
import 'package:getx_chepter_1/app/binding/productbinding.dart';
import 'package:getx_chepter_1/app/modules/product/view/cart_view.dart';
import 'package:getx_chepter_1/app/modules/product/view/check_out_view.dart';
import 'package:getx_chepter_1/app/modules/product/view/product_detail_view.dart';
import 'package:getx_chepter_1/app/modules/product/view/product_view.dart';
import 'package:getx_chepter_1/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.PRODUCT,
      page: () => ProductView(),
      bindings: [Productbinding()],
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAILs,
      page: () => ProductDetailView(),
      binding: Cartbinding(),
    ),
    GetPage(name: AppRoutes.CART, page: () => CartView()),
    GetPage(name: AppRoutes.CHECKOUT, page: () => CheckOutView()),
  ];
}
