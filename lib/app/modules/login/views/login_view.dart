import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getfireapp/constants/constantcolors.dart';
import 'package:getfireapp/constants/customtextFild.dart';
import 'package:getfireapp/constants/dimentions.dart';
import 'package:getfireapp/constants/statictext.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final _form = GlobalKey<FormState>();
  var _email = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantcolors.BROWN,
      appBar: AppBar(title: const Text(Statictext.LOGIN), centerTitle: true),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          Customtextfild(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return Statictext.ENTERVALIDEMAIL;
                              }
                            },
                            onSaved: (newvalue) {
                              _email = newvalue!;
                            },
                            lable: Statictext.EMAIL,
                            icon: Icon(Icons.email),
                          ),
                          Customtextfild(
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return Statictext.ENTERDIGIT;
                              }
                            },
                            onSaved: (newvalue) {
                              _password = newvalue!;
                            },
                            lable: Statictext.PASSWORD,
                            obscureText: true,
                            icon: Icon(Icons.password),
                          ),
                          SizedBox(height: Dimentions.HEIGHT20),
                          Obx(() {
                            return ElevatedButton(
                              onPressed: () async {
                                if (_form.currentState!.validate()) {
                                  _form.currentState!.save();
                                }
                                controller.auth(_email, _password, context);
                              },
                              child: controller.isLogin.value
                                  ? Text(Statictext.LOGIN)
                                  : Text(Statictext.SIGNUP),
                            );
                          }),
                          Obx(() {
                            return TextButton(
                              onPressed: () {
                                controller.isSignIp();
                              },
                              child: Text(
                                controller.isLogin.value
                                    ? Statictext.DONTHAVEACCOUNT
                                    : Statictext.ALREADYHAVEACCOUNT,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
