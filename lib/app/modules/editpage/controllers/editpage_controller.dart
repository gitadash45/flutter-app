import 'dart:developer';
import 'dart:io';
import 'package:getfireapp/app/modules/profile/bindings/profile_binding.dart';
import 'package:getfireapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfireapp/app/services/firebasefirestorer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class EditpageController extends GetxController {
  final profileConroller = Get.find<ProfileController>();
  RxString dateString = ''.obs;
  final RxString selectedGender = 'male'.obs;
  final RxList<String> selected = <String>[].obs;
  File? image;
  RxString imagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  final hobbiesController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(dateString.value),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dateString.value) {
      dateString.value = picked.toIso8601String();
    }
  }

  Future<void> selectImage() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
      if (image != null) {
        final appDir = await syspaths.getApplicationDocumentsDirectory();
        final imagePathLocal = path.basename(image!.path);
        log(imagePathLocal);
        final copiedImage = await image!.copy('${appDir.path}/$imagePathLocal');
        log("$copiedImage");
        imagePath.value = copiedImage.path;
        log(imagePath.value);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    log(FirebaseAuth.instance.currentUser!.uid);
    getUSERData();
    dateString.value = profileConroller.dateController.value;
  }

  void setData(
    String username,
    String imageurl,
    String dob,
    String gender,
    List<String> hobbies,
    String phonenumber,
  ) {
    Firebasefirestorer().storeDate(
      username,
      imageurl,
      dob,
      gender,
      hobbies,
      phonenumber,
    );
  }

  void getUSERData() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final firestoreinstance = FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .snapshots();
    firestoreinstance.listen((snapshot) {
      final data = snapshot.data() as Map<String, dynamic>;
      usernameController.text = data['username'] ?? '';
      imagePath.value = data['image_url'] ?? '';
      phoneController.text = data['phone_number'] ?? '';
      log(phoneController.text);
      if (data['hobbies'] is List) {
        selected.value = (data['hobbies'] as List).cast<String>();
      }
      dateString = data['dob'] ?? '';
      selectedGender.value = data['gender'] ?? '';
    });
  }
}
