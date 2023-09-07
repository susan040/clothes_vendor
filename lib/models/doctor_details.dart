List<DoctorDetails> doctorsDetailFromJson(List<dynamic> doctorsJson) =>
    List<DoctorDetails>.from(
        doctorsJson
        .map((doctorsJson) => DoctorDetails.fromJson(doctorsJson)));
class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? type;
  String? phone;
  DoctorDetails? doctorDetails;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.type,
      this.phone,
      this.doctorDetails});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    phone = json['phone'];
    doctorDetails = json['doctorDetails'] != null
        ? DoctorDetails.fromJson(json['doctorDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['phone'] = phone;
    if (doctorDetails != null) {
      data['doctorDetails'] = doctorDetails!.toJson();
    }
    return data;
  }
}

class DoctorDetails {
  String? id;
  String? category;
  String? patients;
  String? experience;
  String? bioData;
  String? status;
  String? userId;
  String? time;
  String? displayImage;

  DoctorDetails(
      {this.id,
      this.category,
      this.patients,
      this.experience,
      this.bioData,
      this.status,
      this.userId,
      this.time,
      this.displayImage});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    patients = json['patients'];
    experience = json['experience'];
    bioData = json['bio_data'];
    status = json['status'];
    userId = json['user_id'];
    time = json['time'];
    displayImage = json['display_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['patients'] = patients;
    data['experience'] = experience;
    data['bio_data'] = bioData;
    data['status'] = status;
    data['user_id'] = userId;
    data['time'] = time;
    data['display_image'] = displayImage;
    return data;
  }
}
