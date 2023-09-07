import 'package:clothes_vendor/controller/splash_screen_controller.dart';
import 'package:clothes_vendor/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash-screen";
  SplashScreen({super.key});
  final c = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Column(
        children: [
          Center(
              child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(ImagePath.logo))),
          )),
          const CircularProgressIndicator()
        ],
      )),
    );
  }
}
