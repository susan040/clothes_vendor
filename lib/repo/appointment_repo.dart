import 'dart:convert';

import 'package:clothes_vendor/models/get_appointment.dart';
import 'package:clothes_vendor/utils/api.dart';
import 'package:http/http.dart' as http;

class AppointmentRepo {
  static Future<void> getAppointments({
    required Function(List<Appointments> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      //var token = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      //print(Uri.parse(Api.petItems));
      http.Response response = await http.get(
        Uri.parse(Api.appointments),
        headers: headers,
      );
      //print("API hited");
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //print("12213123213");

        List<Appointments> appointments =
            appointmentFromJson(data["data"]);
        onSuccess(appointments);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      // log(e.toString());
      onError("Sorry! something went wrong");
      print(e);
    }
  }
}
