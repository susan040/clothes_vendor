import 'package:clothes_vendor/models/get_appointment.dart';
import 'package:clothes_vendor/repo/appointment_repo.dart';
import 'package:clothes_vendor/utils/custom_snackbar.dart';
import 'package:get/get.dart';

class HistoryScreenController extends GetxController{
   RxList<Appointments> appointmentDetails = <Appointments>[].obs;

  RxBool loading = RxBool(false);

  @override
  void onInit() {
    getAllAppointmentDetails();
    super.onInit();
  }

  getAllAppointmentDetails() async {
    loading.value = true;
    await AppointmentRepo.getAppointments(onSuccess: (appointments) {
      loading.value = false;
      appointmentDetails.addAll(appointments);
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(title: "appointments", message: message);
    });
  }
}
