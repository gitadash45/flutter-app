import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getfireapp/app/services/shared_preferences.dart';

class Firebasefirestorer {
  void storeDate(
    String username,
    String imageurl,
    String dob,
    String gender,
    List<String> hobbies,
    String phonenumber,
  ) async {
    //final uid = await SharedPreferencesHelper.getPrefs('uid');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('user').doc(uid).update({
      'username': username,
      'image_url': imageurl,
      'dob': dob,
      'phone_number': phonenumber,
      'gender': gender,
      'hobbies': hobbies,
    });
  }
}
