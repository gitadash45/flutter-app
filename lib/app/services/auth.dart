import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfireapp/app/routes/app_pages.dart';
import 'package:getfireapp/app/services/shared_preferences.dart';

class Auth {
  Auth({this.isLogin = true});
  final _firebase = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool isLogin;
  void authentication(
    String _email,
    String _password,
    BuildContext context,
  ) async {
    try {
      if (isLogin) {
        final userData = await _firebase.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        await SharedPreferencesHelper.setPrefs('Email', _email);
        // await SharedPreferencesHelper.setPrefs('password', _password);
        await Get.offAllNamed(AppPages.HOME);
        print('jhhgjh$userData');
      } else {
        final userData = await _firebase.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        await SharedPreferencesHelper.setPrefs('Email', _email);
        await SharedPreferencesHelper.setPrefs('uid', userData.user!.uid);

        print(userData);

        await _firestore.collection('user').doc(userData.user!.uid).set({
          'username': '.....username',
          'Email': _email,
          'image_url': 'image_url',
          'dob': 'dob',
          'phone_number': 'Phone Number',
          'gender': 'gender',
          'hobbies': null,
        });
        await Get.offAllNamed(AppPages.HOME);
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        ///
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.message ?? 'Authentication failed')),
      );
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    await SharedPreferencesHelper.logOutPrefs();
    Get.offAllNamed(AppPages.INITIAL);
  }
}
