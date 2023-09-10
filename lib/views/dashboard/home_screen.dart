import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothes_vendor/controller/dashboard/home_screen_controller.dart';
import 'package:clothes_vendor/utils/colors.dart';
import 'package:clothes_vendor/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/core_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  HomeScreen({super.key});
  final c = Get.put(HomeScreenController());

  final coreController = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("History",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, top: 10, bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 2.7,
                  imageUrl: coreController
                          .currentUser.value!.doctorDetails?.displayImage ??
                      "",
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/profile.jpg',
                    height: MediaQuery.of(context).size.height / 2.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              title: Row(
                children: [
                  Text("Email:",
                      style:
                          CustomTextStyles.f16W600(color: AppColors.textColor)),
                  const SizedBox(width: 5),
                  Text(coreController.currentUser.value!.email ?? "",
                      style:
                          CustomTextStyles.f16W400(color: AppColors.textColor)),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              title: Row(
                children: [
                  Text("Status:",
                      style:
                          CustomTextStyles.f16W600(color: AppColors.textColor)),
                  const SizedBox(width: 5),
                  Text(
                      coreController.currentUser.value!.doctorDetails?.status ??
                          "",
                      style:
                          CustomTextStyles.f16W400(color: AppColors.textColor)),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              title: Row(
                children: [
                  Text("bioData:",
                      style:
                          CustomTextStyles.f16W600(color: AppColors.textColor)),
                  const SizedBox(width: 5),
                  Text(
                      coreController
                              .currentUser.value!.doctorDetails?.bioData ??
                          "",
                      style:
                          CustomTextStyles.f16W400(color: AppColors.textColor)),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              title: Row(
                children: [
                  Text("Experience:",
                      style:
                          CustomTextStyles.f16W600(color: AppColors.textColor)),
                  const SizedBox(width: 5),
                  Text(
                      coreController
                              .currentUser.value!.doctorDetails?.experience ??
                          "",
                      style:
                          CustomTextStyles.f16W400(color: AppColors.textColor)),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
