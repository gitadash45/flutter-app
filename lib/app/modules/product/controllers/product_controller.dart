import 'package:get/get.dart';
import 'package:getx_chepter_1/app/modules/product/model/product_model.dart';
import 'package:getx_chepter_1/app/services/product_services.dart';

class ProductController extends GetxController {
  var productsList = <ProductModel>[].obs;
  final ProductServices productServices;
  var errormsg = ''.obs;
  var isLoading = false.obs;

  ProductController({required this.productServices});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errormsg('');
      var products = await productServices.fetchProducts();
      productsList.addAll(products);
      print(products.length);
    } catch (e) {
      errormsg('failed to fetch');
    } finally {
      isLoading(false);
    }
  }
}
