import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfireapp/app/model/usermodel.dart';
import 'package:getfireapp/app/services/auth.dart';
import 'package:getfireapp/app/services/shared_preferences.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  // final Rxn<UserModel> user = Rxn<UserModel>();
  late final DocumentReference<UserModel> _userDocRef;
  final usernameController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final RxString dateController = ''.obs; // For DOB display
  final RxList<String> hobbiesList = <String>[].obs; // For hobbies
  RxString image_url = ''.obs;
  RxString gender = "".obs;

  @override
  void onInit() {
    super.onInit();
    // _initUserStream();
    log(FirebaseAuth.instance.currentUser!.uid);
    // getData();
    getUSERData();
    log('initmethodcall');
  }

  void getUSERData() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final firestoreinstance = FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .snapshots();
    firestoreinstance.listen((snapshot) {
      final data = snapshot.data() as Map<String, dynamic>;
      log(data.toString());
      usernameController.text = data['username'] ?? '';
      emailController.text = data['Email'] ?? '';
      phoneController.text = data['phone_number'] ?? '';
      genderController.text = data['gender'] ?? '';

      dateController.value = data['dob'] ?? '';
      image_url.value = data['image_url'] ?? '';
      log(image_url.value);
      // Parse hobbies (must be List)
      // log(data[''])
      if (data['hobbies'] is List) {
        hobbiesList.value = (data['hobbies'] as List).cast<String>();
      }
    });
  }

  void logOut() => Auth().logOut();
}
