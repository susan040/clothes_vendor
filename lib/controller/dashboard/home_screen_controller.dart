import 'package:clothes_vendor/models/doctor_details.dart';
import 'package:clothes_vendor/repo/doctor_repo.dart';
import 'package:clothes_vendor/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final dateKeys = GlobalKey<FormState>();
  RxList<DoctorDetails> allDoctorDetails = <DoctorDetails>[].obs;
  TextEditingController startDateController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;

  RxBool loading = RxBool(false);

  @override
  void onInit() {
    getAllItemsDetails();
    //getAllAppointmentDetails();
    super.onInit();
  }

  getAllItemsDetails() async {
    loading.value = true;
    await DoctorDetailRepo.getDoctorDetails(onSuccess: (doctor) {
      loading.value = false;
      allDoctorDetails.addAll(doctor);
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(title: "item", message: message);
    });
  }
}