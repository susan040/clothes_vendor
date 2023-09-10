import 'package:clothes_vendor/controller/core_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(CoreController());
      }),
      home: SplashScreen(),
    );
  }
}
