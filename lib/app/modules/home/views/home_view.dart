import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getfireapp/app/routes/app_pages.dart';
import 'package:getfireapp/constants/constantcolors.dart';
import 'package:getfireapp/constants/statictext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Statictext.HOMEPAGE),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppPages.PROFILE);
            },
            icon: Icon(Icons.person_2),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // focusColor: Colors.amber,
                    tileColor: Constantcolors.BLUEGREY,

                    enabled: true,
                    title: Text(
                      controller.productList[index].title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      controller.productList[index].description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    leading: Image.network(
                      controller.productList[index].image!,
                      height: 100,
                      width: 100,
                    ),
                    trailing: Text(
                      '\$${controller.productList[index].price.toString()}',
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      Get.toNamed(
                        AppPages.PRODUCTDETAILS,
                        arguments: controller.productList[index],
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
