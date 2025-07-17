import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getfireapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:getfireapp/constants/constantcolors.dart';
import 'package:getfireapp/constants/customtextFild.dart';
import 'package:getfireapp/constants/dimentions.dart';
import 'package:getfireapp/constants/statictext.dart';

import '../controllers/editpage_controller.dart';

class EditpageView extends GetView<EditpageController> {
  final _formkey = GlobalKey<FormState>();
  final profileController = Get.find<ProfileController>();
  EditpageView({super.key});
  // String username = '';
  // String phoneNumber = '';
  DateTime pickdate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Statictext.EDITPROFILE),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundColor: Constantcolors.BLUEGREY,
                        radius: 100,
                        foregroundImage: controller.imagePath.value.isEmpty
                            ? NetworkImage(
                                'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg',
                              )
                            : FileImage(File(controller.imagePath.value)),
                      ),
                    ),

                    Positioned(
                      bottom: 15,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constantcolors.BLACK,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.selectImage();
                          },
                          icon: Icon(Icons.edit, color: Constantcolors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Customtextfild(
                  validator: (Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return Statictext.ENTERUSERNAME;
                    }
                  },
                  onSaved: (newValue) {
                    // username = newValue!;
                  },
                  lable: Statictext.USERNAME,
                  icon: Icon(Icons.person),
                  controller: profileController.usernameController,
                ),

                Customtextfild(
                  validator: (Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return Statictext.ENTERPHONENUMBER;
                    }
                  },
                  onSaved: (newValue) {
                    // phoneNumber = newValue!;
                  },
                  lable: Statictext.PHONENUMBER,
                  icon: Icon(Icons.phone),
                  controller: profileController.phoneController,
                ),
                SizedBox(height: Dimentions.HEIGHT20),
                // Dimentions.HEIGHT20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Statictext.DOB, style: TextStyle(fontSize: 18)),
                    SizedBox(width: Dimentions.WIDTH10),
                    Container(
                      height: 45,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Constantcolors.white,
                        border: Border.all(
                          width: 1,
                          color: Constantcolors.BLACK,
                        ),
                      ),
                      child: Obx(() {
                        log('${controller.phoneController}');
                        return Text(
                          '${controller.dateString.split('T').first}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Constantcolors.BLACK,
                          ),
                        );
                      }),
                    ),
                    SizedBox(width: Dimentions.WIDTH10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                      ),
                      onPressed: () {
                        controller.selectDate(context);
                      },
                      child: Text(Statictext.PICKDATE),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Obx(() {
                      return Expanded(
                        child: ListTile(
                          title: Text(Statictext.MALE),
                          leading: Radio(
                            value: 'male',
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.selectedGender.value = value!;
                            },
                          ),
                        ),
                      );
                    }),
                    Obx(() {
                      return Expanded(
                        child: ListTile(
                          title: Text(Statictext.FEMALE),
                          leading: Radio(
                            value: 'female',
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.selectedGender.value = value!;
                            },
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${Statictext.SELECTTHEHOBBY} :',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.hobbiesController,
                        decoration: InputDecoration(
                          label: Text(Statictext.ADDHOBBIES),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // controller.options.add(
                        //   controller.hobbiesController.text,
                        // );
                        controller.selected.add(
                          controller.hobbiesController.text,
                        );
                        controller.hobbiesController.clear();
                        FocusScope.of(context).unfocus();
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
                SizedBox(height: Dimentions.HEIGHT10),
                Obx(
                  () => Wrap(
                    spacing: 8,
                    children: controller.selected.map((options) {
                      return FilterChip(
                        label: Text(options),
                        selected: controller.selected.contains(options),
                        onSelected: (bool value) {
                          value
                              ? controller.selected.add(options)
                              : controller.selected.remove(options);
                        },
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: Dimentions.HEIGHT20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    minimumSize: Size(50, 45),
                    padding: EdgeInsets.symmetric(horizontal: 150),
                    backgroundColor: Constantcolors.BLUEGREY,
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                    }
                    if (profileController.usernameController.text.isEmpty ||
                        profileController.image_url.value.isEmpty ||
                        controller.dateString.isEmpty ||
                        controller.selectedGender.value.isEmpty ||
                        controller.selected.isEmpty ||
                        controller.phoneController.text.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Enter all details',
                        backgroundColor: Constantcolors.DEEPORANGE,
                      );
                      return;
                    }
                    controller.setData(
                      controller.usernameController.text,
                      controller.imagePath.value,
                      controller.dateString.value.split(' ').first,
                      controller.selectedGender.value,
                      controller.selected,
                      controller.phoneController.text,
                    );
                    Get.back();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20, color: Constantcolors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
