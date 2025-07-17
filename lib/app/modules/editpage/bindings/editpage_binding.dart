import 'package:get/get.dart';

import '../controllers/editpage_controller.dart';

class EditpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditpageController>(
      () => EditpageController(),
    );
  }
}
