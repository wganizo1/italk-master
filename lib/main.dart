import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iTalk/controllers/controller.dart';
import 'package:iTalk/get_routes.dart';
import 'package:iTalk/views/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CalculateController calculateController =
      Get.put<CalculateController>(CalculateController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iTalk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: AppRoutes.routes,
    );
  }
}
