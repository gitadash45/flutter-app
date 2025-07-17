import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getfireapp/app/routes/app_pages.dart';
import 'package:getfireapp/constants/constantcolors.dart';
import 'package:getfireapp/constants/customtextFild.dart';
import 'package:getfireapp/constants/dimentions.dart';
import 'package:getfireapp/constants/statictext.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final u = controller.user.value;
    // print(u);
    log(controller.image_url.value);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 208, 223),
      appBar: AppBar(
        title: const Text(Statictext.PROFILE),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.logOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Obx(
                () => CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 100,
                  foregroundImage: controller.image_url.value.isEmpty
                      ? NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg',
                        )
                      : FileImage(File(controller.image_url.value)),
                ),
              ),
              Customtextfild(
                lable: Statictext.USERNAME,
                controller: controller.usernameController,
                icon: Icon(Icons.person),
                readonly: true,
              ),
              Customtextfild(
                readonly: true,
                controller: controller.emailController,
                lable: Statictext.EMAIL,
                icon: Icon(Icons.email),
              ),
              Customtextfild(
                lable: Statictext.PHONENUMBER,
                icon: Icon(Icons.phone),
                controller: controller.phoneController,
                readonly: true,
              ),
              SizedBox(height: Dimentions.HEIGHT20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${Statictext.DOB} :',
                    style: TextStyle(fontSize: 18, color: Constantcolors.BLACK),
                  ),
                  SizedBox(width: Dimentions.WIDTH10),
                  Container(
                    height: 45,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Constantcolors.white,
                      border: Border.all(width: 1, color: Constantcolors.GREY),
                    ),
                    child: Obx(() {
                      return controller.dateController.value.isEmpty
                          ? Text(
                              Statictext.NODATESELECTED,
                              style: TextStyle(
                                fontSize: 18,
                                color: Constantcolors.GREY,
                              ),
                            )
                          : Text(
                              controller.dateController.split('T').first,
                              style: TextStyle(
                                fontSize: 18,
                                color: Constantcolors.BLACK,
                              ),
                            );
                    }),
                  ),
                ],
              ),
              Customtextfild(
                lable: Statictext.GENDER,
                icon: Icon(Icons.person_2_sharp),
                controller: controller.genderController,
                readonly: true,
              ),
              Text(
                '${Statictext.HOBBIES} : ',
                style: TextStyle(fontSize: 16, color: Constantcolors.BLACK),
              ),
              Obx(() {
                return Wrap(
                  spacing: 8,
                  children: controller.hobbiesList
                      .map(
                        (h) => Chip(
                          label: Text(
                            h,
                            style: TextStyle(color: Constantcolors.BLACK),
                          ),
                        ),
                      )
                      .toList(),
                );
              }),
              SizedBox(height: Dimentions.HEIGHT20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  minimumSize: Size(50, 45),
                  padding: EdgeInsets.symmetric(horizontal: 150),
                ),
                onPressed: () {
                  Get.toNamed(AppPages.EDITPAGE);
                },
                child: Text('Edit', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
