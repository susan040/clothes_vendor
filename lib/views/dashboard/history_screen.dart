import 'package:clothes_vendor/controller/dashboard/history_screen_controller.dart';
import 'package:clothes_vendor/models/get_appointment.dart';
import 'package:clothes_vendor/utils/colors.dart';
import 'package:clothes_vendor/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = "/explore-screen";
  HistoryScreen({super.key});
  final c = Get.put(HistoryScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("History",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.appointmentDetails.clear();
          c.getAllAppointmentDetails();
        },
        child: SafeArea(
          child: Obx(
            () => (c.loading.value)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: c.appointmentDetails.length,
                    itemBuilder: (context, index) {
                      Appointments appointments = c.appointmentDetails[index];
                      return AllAppointments(appointmentDetails: appointments);
                    }),
          ),
        ),
      ),
    );
  }
}

class AllAppointments extends StatelessWidget {
  const AllAppointments({
    super.key,
    required this.appointmentDetails,
  });

  final Appointments appointmentDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.lOrange, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          //Text(petItems.displayImage ?? ""),
          Text(appointmentDetails.id ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Doctor:"),
              Text(appointmentDetails.doctorId ?? ""),
            ],
          ),
          Text(appointmentDetails.date ?? ""),
          Text(appointmentDetails.status ?? ""),
          Text(appointmentDetails.customer?.name ?? ""),
        ],
      ),
    );
  }
}
