import 'dart:convert';

import 'package:clothes_vendor/models/doctor_details.dart';
import 'package:clothes_vendor/utils/api.dart';
import 'package:http/http.dart' as http;

class DoctorDetailRepo{
  static Future<void> getDoctorDetails({
    required Function(List<DoctorDetails> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      //print(Uri.parse(Api.petItems));
      http.Response response = await http.get(
        Uri.parse(Api.petItems),
        headers: headers,
      );
      //print("API hited");
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //print("12213123213");

        List<DoctorDetails> doctors = doctorsDetailFromJson(data["data"]);
        onSuccess(doctors);
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