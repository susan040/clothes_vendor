import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothes_vendor/controller/dashboard/home_screen_controller.dart';
import 'package:clothes_vendor/models/doctor_details.dart';
import 'package:clothes_vendor/utils/colors.dart';
import 'package:clothes_vendor/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  DoctorScreen({super.key, required this.doctors});
  final c = Get.put(HomeScreenController());
  final DoctorDetails doctors;
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
        title: Text("Doctor",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 25, left: 25, top: 10, bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height / 2.7,
                imageUrl: doctors.displayImage ?? "",
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
                const Text("Name:"),
                const SizedBox(width: 5),
                Text(doctors.id ?? ""),
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
                const Text("Email:"),
                const SizedBox(width: 5),
                Text(doctors.status ?? ""),
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
                const Text("Email:"),
                const SizedBox(width: 5),
                Text(doctors.experience ?? ""),
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
                const Text("Time:"),
                const SizedBox(width: 5),
                Text(doctors.time ?? ""),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
