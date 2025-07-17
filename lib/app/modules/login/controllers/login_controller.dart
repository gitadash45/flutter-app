import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfireapp/app/services/auth.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  // bool auth = await FirebaseAuth.instance.authStateChanges().isEmpty;

  final count = 0.obs;
  RxBool isLogin = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void isSignIp() => isLogin.value = !isLogin.value;
  void auth(String _email, String _password, BuildContext context) {
    Auth(isLogin: isLogin.value).authentication(_email, _password, context);
  }
}
