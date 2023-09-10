import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final dateKeys = GlobalKey<FormState>();
  // RxList<DoctorDetails> allDoctorDetails = <DoctorDetails>[].obs;
  TextEditingController startDateController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;

  RxBool loading = RxBool(false);
}