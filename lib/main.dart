import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfireapp/app/modules/login/controllers/login_controller.dart';
import 'package:getfireapp/app/services/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  final bool isLogin;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final store = await SharedPreferencesHelper.getPrefs('Email');
  if (store == null) {
    isLogin = false;
    print('sjhgvjs');
  } else {
    isLogin = true;
    print('object');
  }
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: isLogin ? AppPages.HOME : AppPages.INITIAL,
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
