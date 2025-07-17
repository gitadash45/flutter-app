import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_chepter_1/app/routes/app_pages.dart';
import 'package:getx_chepter_1/app/routes/app_routes.dart';
import 'package:getx_chepter_1/app/services/caet_services.dart';
import 'package:getx_chepter_1/app/services/themeservices.dart';
import 'package:getx_chepter_1/app/services/translation.dart';

void main() async {
  await GetStorage.init();
  Get.put<CaetServices>(CaetServices());
  // Get.lazyPut(() => CaetServices());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product-App',
      translations: AppTranslations(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('es', 'ES'),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.PRODUCT,
      darkTheme: ThemeData.dark(),
      themeMode: Themeservices().theme,
    );
  }
}
