import 'dart:convert';

class DriverModel {
  final int id;
  final int? laundryId;
  final String firstName;
  final String lastName;
  final DateTime? dob;
  final int? stateId;
  final int? cityId;
  final String ssn;
  final String driverType;
  final String phone;
  final String email;
  final int? zoneId;
  final String status;
  final String language;
  final String bankAccountNumber;
  final String bankRoutingNumber;
  final String address;
  final bool vehicleInsured;
  final bool canLift40Lb;
  final bool ageCheck;
  final String frontId;
  final String backId;
  final String driverEmail;
  final String mobile;
  final String zipcode;
  final String model;
  final String make;
  final int? year;
  final String color;
  final bool registerCar;
  final String vehiclePhoto;
  final String driverSelfie;
  final String drivingLicense;
  final bool rulesRegulation;
  final String securityToken;

  DriverModel({
    required this.id,
    this.laundryId,
    required this.firstName,
    required this.lastName,
    this.dob,
    this.stateId,
    this.cityId,
    required this.ssn,
    required this.driverType,
    required this.phone,
    required this.email,
    this.zoneId,
    required this.status,
    required this.language,
    required this.bankAccountNumber,
    required this.bankRoutingNumber,
    required this.address,
    required this.vehicleInsured,
    required this.canLift40Lb,
    required this.ageCheck,
    required this.frontId,
    required this.backId,
    required this.driverEmail,
    required this.mobile,
    required this.zipcode,
    required this.model,
    required this.make,
    this.year,
    required this.color,
    required this.registerCar,
    required this.vehiclePhoto,
    required this.driverSelfie,
    required this.drivingLicense,
    required this.rulesRegulation,
    required this.securityToken,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    final contact = json['contact_details'] != null
        ? Map<String, dynamic>.from(jsonDecode(json['contact_details']))
        : {};

    int? tryParseInt(dynamic value) =>
        int.tryParse(value.toString());

    bool tryParseBool(dynamic value) =>
        value.toString() == '1' || value.toString().toLowerCase() == 'true';

    DateTime? tryParseDate(String? dateStr) {
      if (dateStr == null) return null;
      try {
        return DateTime.parse(dateStr);
      } catch (_) {
        return null;
      }
    }

    return DriverModel(
      id: tryParseInt(json['id']) ?? 0,
      laundryId: tryParseInt(json['laundry_id']),
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      dob: tryParseDate(json['dob']),
      stateId: tryParseInt(json['state_id']),
      cityId: tryParseInt(json['city_id']),
      ssn: json['ssn'] ?? '',
      driverType: json['driver_type'] ?? '',
      phone: contact['phone'] ?? '',
      email: contact['email'] ?? '',
      zoneId: tryParseInt(json['zone_id']),
      status: json['status'] ?? '',
      language: json['language'] ?? '',
      bankAccountNumber: json['bank_account_number'] ?? '',
      bankRoutingNumber: json['bank_routing_number'] ?? '',
      address: json['address'] ?? '',
      vehicleInsured: tryParseBool(json['vehicle_insured']),
      canLift40Lb: tryParseBool(json['can_lift_40_lb']),
      ageCheck: tryParseBool(json['age_check']),
      frontId: json['front_id'] ?? '',
      backId: json['back_id'] ?? '',
      driverEmail: json['driver_email'] ?? '',
      mobile: json['mobile'] ?? '',
      zipcode: json['zipcode'] ?? '',
      model: json['model'] ?? '',
      make: json['make'] ?? '',
      year: tryParseInt(json['year']),
      color: json['color'] ?? '',
      registerCar: tryParseBool(json['register_car']),
      vehiclePhoto: json['vehicle_photo'] ?? '',
      driverSelfie: json['driver_selfie'] ?? '',
      drivingLicense: json['driving_license'] ?? '',
      rulesRegulation: tryParseBool(json['rules_regulation']),
      securityToken: json['security_token'] ?? '',
    );
  }
}
