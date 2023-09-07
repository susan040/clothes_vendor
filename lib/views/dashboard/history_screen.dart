import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = "/explore-screen";
  const HistoryScreen({super.key});
  //final c = Get.put(HistoryScreenController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("History"),
        ],
      )),
      // body: RefreshIndicator(
      //   onRefresh: () async {
      //     c.appointmentDetails.clear();
      //     c.getAllAppointmentDetails();
      //   },
      //   child: SafeArea(
      //     child: Obx(
      //       () => (c.loading.value)
      //           ? const Center(child: CircularProgressIndicator())
      //           : ListView.builder(
      //               shrinkWrap: true,
      //               scrollDirection: Axis.vertical,
      //               itemCount: c.appointmentDetails.length,
      //               itemBuilder: (context, index) {
      //                 AppointmentDetails appointments =
      //                     c.appointmentDetails[index];
      //                 return AllAppointmets(appointmentDetails: appointments);
      //               }),
      //     ),
      //   ),
      // ),
    );
  }
}
