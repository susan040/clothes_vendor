List<Appointments> appointmentFromJson(List<dynamic> appointmentJson) =>
    List<Appointments>.from(appointmentJson.map(
        (appointmentJson) => Appointments.fromJson(appointmentJson)));


class Appointments {
  String? id;
  String? doctorId;
  String? date;
  String? status;
  String? userId;
  Customer? customer;

  Appointments(
      {this.id,
      this.doctorId,
      this.date,
      this.status,
      this.userId,
      this.customer});

  Appointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    status = json['status'];
    userId = json['user_id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['date'] = date;
    data['status'] = status;
    data['user_id'] = userId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? type;

  Customer(
      {this.id, this.name, this.phone, this.email, this.password, this.type});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    return data;
  }
}
