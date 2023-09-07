import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothes_vendor/controller/dashboard/home_screen_controller.dart';
import 'package:clothes_vendor/models/doctor_details.dart';
import 'package:clothes_vendor/utils/colors.dart';
import 'package:clothes_vendor/utils/custom_text_styles.dart';
import 'package:clothes_vendor/views/dashboard/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  HomeScreen({super.key});
  final c = Get.put(HomeScreenController());
  // final DoctorDetails selectedDoctor = DoctorDetails(
  //   id: 'Selected Doctor ID',
  //   status: 'Selected Doctor Status',
  //   experience: 'Selected Doctor Experience',
  //   time: 'Selected Doctor Time',
  //   displayImage: 'selected_doctor_image_url.jpg',
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("Doctor",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      //body: AllItemsCard(petItems: ),
    );
  }
}

class AllItemsCard extends StatelessWidget {
  const AllItemsCard({
    super.key,
    required this.petItems,
  });

  final DoctorDetails petItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(10)),
        child: Column(
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
                  imageUrl: petItems.displayImage ?? "",
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
                  Text(petItems.id ?? ""),
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
                  Text(petItems.status ?? ""),
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
                  Text(petItems.experience ?? ""),
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
                  Text(petItems.time ?? ""),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
