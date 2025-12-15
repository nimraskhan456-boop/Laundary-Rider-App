// class DriverRegistrationResponse {
//   final String status;
//   final String message;
//   final String responseCode;
//   final String result;
//   final DriverDetails? driverDetails;

//   DriverRegistrationResponse({
//     required this.status,
//     required this.message,
//     required this.responseCode,
//     required this.result,
//     this.driverDetails,
//   });

//   factory DriverRegistrationResponse.fromJson(Map<String, dynamic> json) {
//     return DriverRegistrationResponse(
//       status: json['status'] ?? '',
//       message: json['message'] ?? '',
//       responseCode: json['ResponseCode'] ?? '',
//       result: json['Result'] ?? '',
//       driverDetails: json['DriverDetails'] != null
//           ? DriverDetails.fromJson(json['DriverDetails'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'ResponseCode': responseCode,
//       'Result': result,
//       'DriverDetails': driverDetails?.toJson(),
//     };
//   }
// }

// class DriverDetails {
//   final String driverId;
//   final String firstName;
//   final String lastName;
//   final String dob;
//   final String stateId;
//   final String ssn;
//   final String driverType;
//   final String contactDetails;
//   final int zone;
//   final String status;
//   final String language;
//   final String accountNumber;
//   final String routingNumber;
//   final String address;
//   final bool conditionVehicleInsured;
//   final bool conditionLiftWeight;
//   final bool conditionTwentyYears;
//   final String driverEmail;
//   final String countryCode;
//   final String mobile;
//   final String securityToken;

//   DriverDetails({
//     required this.driverId,
//     required this.firstName,
//     required this.lastName,
//     required this.dob,
//     required this.stateId,
//     required this.ssn,
//     required this.driverType,
//     required this.contactDetails,
//     required this.zone,
//     required this.status,
//     required this.language,
//     required this.accountNumber,
//     required this.routingNumber,
//     required this.address,
//     required this.conditionVehicleInsured,
//     required this.conditionLiftWeight,
//     required this.conditionTwentyYears,
//     required this.driverEmail,
//     required this.countryCode,
//     required this.mobile,
//     required this.securityToken,
//   });

//   factory DriverDetails.fromJson(Map<String, dynamic> json) {
//     return DriverDetails(
//       driverId: json['driver_id'] ?? '',
//       firstName: json['first_name'] ?? '',
//       lastName: json['last_name'] ?? '',
//       dob: json['dob'] ?? '',
//       stateId: json['state_id'] ?? '',
//       ssn: json['ssn'] ?? '',
//       driverType: json['driver_type'] ?? '',
//       contactDetails: json['contact_details'] ?? '',
//       zone: json['zone'] ?? 1,
//       status: json['status'] ?? '',
//       language: json['language'] ?? '',
//       accountNumber: json['account_number'] ?? '',
//       routingNumber: json['routing_number'] ?? '',
//       address: json['address'] ?? '',
//       conditionVehicleInsured: json['condition_vehicle_insured'] ?? false,
//       conditionLiftWeight: json['condition_lift_weight'] ?? false,
//       conditionTwentyYears: json['condition_20_years'] ?? false,
//       driverEmail: json['driver_email'] ?? '',
//       countryCode: json['ccode'] ?? '',
//       mobile: json['mobile'] ?? '',
//       securityToken: json['security_token'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'driver_id': driverId,
//       'first_name': firstName,
//       'last_name': lastName,
//       'dob': dob,
//       'state_id': stateId,
//       'ssn': ssn,
//       'driver_type': driverType,
//       'contact_details': contactDetails,
//       'zone': zone,
//       'status': status,
//       'language': language,
//       'account_number': accountNumber,
//       'routing_number': routingNumber,
//       'address': address,
//       'condition_vehicle_insured': conditionVehicleInsured,
//       'condition_lift_weight': conditionLiftWeight,
//       'condition_20_years': conditionTwentyYears,
//       'driver_email': driverEmail,
//       'ccode': countryCode,
//       'mobile': mobile,
//       'security_token': securityToken,
//     };
//   }
// }
// class DriverRegistrationResponse {
//   final String status;
//   final String message;
//   final String responseCode;
//   final String result;
//   final DriverDetails? driverDetails;

//   DriverRegistrationResponse({
//     required this.status,
//     required this.message,
//     required this.responseCode,
//     required this.result,
//     this.driverDetails,
//   });

//   factory DriverRegistrationResponse.fromJson(Map<String, dynamic> json) {
//     return DriverRegistrationResponse(
//       status: json['status'] ?? '',
//       message: json['message'] ?? '',
//       responseCode: json['ResponseCode'] ?? '',
//       result: json['Result'] ?? '',
//       driverDetails: json['DriverDetails'] != null
//           ? DriverDetails.fromJson(json['DriverDetails'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'ResponseCode': responseCode,
//       'Result': result,
//       'DriverDetails': driverDetails?.toJson(),
//     };
//   }
// }

// class DriverDetails {
//   final String driverId;
//   final String firstName;
//   final String lastName;
//   final String dob;
//   final String stateId;
//   final String cityId;
//   final String ssn;
//  // final String driverType;
//   //final String contactDetails;
//   //final int zoneId;
//   //final String status;
//   //final String language;
//   final String bankAccountNumber;
//   final String bankRoutingNumber;
//   final String address;
//   final int vehicleInsured;
//   final int canLift40Lb;
//   final int ageCheck;
//   //final bool front_id;
//   //final bool back_id;
//   final String driverEmail;
//   final String driverPassword;
//   final String countryCode;
//   final String mobile;
//   final String zipcode;
//   final String model;
//   final String make;
//   final String year;
//   final String color;
//   final int registerCar;
//   final String rulesRegulation;
//   final String vehiclePhoto;
//   final String driverSelfie;
//   final String drivingLicense;

//   DriverDetails({
//     required this.driverId,
//     required this.firstName,
//     required this.lastName,
//     required this.dob,
//     required this.stateId,
//     required this.cityId,
//     required this.ssn,
//     //required this.driverType,
//     //required this.contactDetails,
//     //required this.front_id,
//     //required this.back_id,
//   //  required this.zoneId,
//    // required this.status,
//     //required this.language,
//     required this.bankAccountNumber,
//     required this.bankRoutingNumber,
//     required this.address,
//     required this.vehicleInsured,
//     required this.canLift40Lb,
//     required this.ageCheck,
//     required this.driverEmail,
//     required this.driverPassword,
//     required this.countryCode,
//     required this.mobile,
//     required this.zipcode,
//     required this.model,
//     required this.make,
//     required this.year,
//     required this.color,
//     required this.registerCar,
//     required this.rulesRegulation,
//     required this.vehiclePhoto,
//     required this.driverSelfie,
//     required this.drivingLicense,
//   });

//   factory DriverDetails.fromJson(Map<String, dynamic> json) {
//     return DriverDetails(
//       driverId: json['driver_id'] ?? '',
//       firstName: json['first_name'] ?? '',
//       lastName: json['last_name'] ?? '',
//       dob: json['dob'] ?? '',
//       stateId: json['state_id'] ?? '',
//       cityId: json['city_id'] ?? '',
//       ssn: json['ssn'] ?? '',
//       //driverType: json['driver_type'] ?? '',
//       //contactDetails: json['contact_details'] ?? '',
//      // zoneId: int.tryParse(json['zone_i'].toString()) ?? 0,
//      // front_id: json['front_id'],
//       //back_id: json['back_id'],
//       //status: json['status'] ?? '',
//       //language: json['language'] ?? '',
//       bankAccountNumber: json['bank_account_number'] ?? '',
//       bankRoutingNumber: json['bank_routing_number'] ?? '',
//       address: json['address'] ?? '',
//       vehicleInsured: json['vehicle_insured'] == "1",
//       canLift40Lb: json['can_lift_40_lb'] == "1",
//       ageCheck: json['age_check'] == "1",
//       driverEmail: json['driver_email'] ?? '',
//       driverPassword: json['driver_password'] ?? '',
//       countryCode: json['ccode'] ?? '',
//       mobile: json['mobile'] ?? '',
//       zipcode: json['zipcode'] ?? '',
//       model: json['model'] ?? '',
//       make: json['make'] ?? '',
//       year: json['year'] ?? '',
//       color: json['color'] ?? '',
//       registerCar: json['register_car'] == "1",
//       rulesRegulation: json['rules_regulation'] == "1",
//       vehiclePhoto: json['vehicle_photo'] ?? '',
//       driverSelfie: json['driver_selfie'] ?? '',
//       drivingLicense: json['driving_license'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'driver_id': driverId,
//       'first_name': firstName,
//       'last_name': lastName,
//       'dob': dob,
//       'state_id': stateId,
//       'city_id': cityId,
//       'ssn': ssn,
//       //'front_id': front_id,
//       //'back_id': back_id,
//       //'driver_type': driverType,
//       //'contact_details': contactDetails,
//       //'zone_id': zoneId,
//      // 'status': status,
//      // 'language': language,
//       'bank_account_number': bankAccountNumber,
//       'bank_routing_number': bankRoutingNumber,
//       'address': address,
//       'vehicle_insured': vehicleInsured ? "1" : "0",
//       'can_lift_40_lb': canLift40Lb ? "1" : "0",
//       'age_check': ageCheck ? "1" : "0",
//       'driver_email': driverEmail,
//       'driver_password': driverPassword,
//       'ccode': countryCode,
//       'mobile': mobile,
//       'zipcode': zipcode,
//       'model': model,
//       'make': make,
//       'year': year,
//       'color': color,
//       'register_car': registerCar ? "1" : "0",
//       'rules_regulation': rulesRegulation ? "1" : "0",
//       'vehicle_photo': vehiclePhoto,
//       'driver_selfie': driverSelfie,
//       'driving_license': drivingLicense,
//     };
//   }
// }
class DriverRegistrationResponse { 
  final String status;
  final String message;
  final String responseCode;
  final String result;
  final DriverDetails? driverDetails;

  DriverRegistrationResponse({
    required this.status,
    required this.message,
    required this.responseCode,
    required this.result,
    this.driverDetails,
  });

  factory DriverRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return DriverRegistrationResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      responseCode: json['ResponseCode'] ?? '',
      result: json['Result'] ?? '',
      driverDetails: json['DriverDetails'] != null
          ? DriverDetails.fromJson(json['DriverDetails'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'ResponseCode': responseCode,
      'Result': result,
      'DriverDetails': driverDetails?.toJson(),
    };
  }
}

class DriverDetails {
  final String driverId;
  final String firstName;
  final String lastName;
  final String dob;
  final String stateId;
  final String cityId;
  final String ssn;
  final String bankAccountNumber;
  final String bankRoutingNumber;
  final String address;
  final int vehicleInsured;  // Changed to int
  final int canLift40Lb;     // Changed to int
  final int ageCheck;        // Changed to int
  final String driverEmail;
  final String driverPassword;
  final String countryCode;
  final String mobile;
  final String zipcode;
  final String model;
  final String make;
  final String year;
  final String color;
  final int registerCar;     // Changed to int
  final int rulesRegulation; // Changed to int
  final String vehiclePhoto;
  final String driverSelfie;
  final String drivingLicense;

  DriverDetails({
    required this.driverId,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.stateId,
    required this.cityId,
    required this.ssn,
    required this.bankAccountNumber,
    required this.bankRoutingNumber,
    required this.address,
    required this.vehicleInsured,
    required this.canLift40Lb,
    required this.ageCheck,
    required this.driverEmail,
    required this.driverPassword,
    required this.countryCode,
    required this.mobile,
    required this.zipcode,
    required this.model,
    required this.make,
    required this.year,
    required this.color,
    required this.registerCar,
    required this.rulesRegulation,
    required this.vehiclePhoto,
    required this.driverSelfie,
    required this.drivingLicense,
  });

  factory DriverDetails.fromJson(Map<String, dynamic> json) {
    return DriverDetails(
      driverId: json['driver_id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      dob: json['dob'] ?? '',
      stateId: json['state_id'] ?? '',
      cityId: json['city_id'] ?? '',
      ssn: json['ssn'] ?? '',
      bankAccountNumber: json['bank_account_number'] ?? '',
      bankRoutingNumber: json['bank_routing_number'] ?? '',
      address: json['address'] ?? '',
      vehicleInsured: int.tryParse(json['vehicle_insured'].toString()) ?? 0,  // Handle as integer
      canLift40Lb: int.tryParse(json['can_lift_40_lb'].toString()) ?? 0,      // Handle as integer
      ageCheck: int.tryParse(json['age_check'].toString()) ?? 0,              // Handle as integer
      driverEmail: json['driver_email'] ?? '',
      driverPassword: json['driver_password'] ?? '',
      countryCode: json['ccode'] ?? '',
      mobile: json['mobile'] ?? '',
      zipcode: json['zipcode'] ?? '',
      model: json['model'] ?? '',
      make: json['make'] ?? '',
      year: json['year'] ?? '',
      color: json['color'] ?? '',
      registerCar: int.tryParse(json['register_car'].toString()) ?? 0,        // Handle as integer
      rulesRegulation: int.tryParse(json['rules_regulation'].toString()) ?? 0, // Handle as integer
      vehiclePhoto: json['vehicle_photo'] ?? '',
      driverSelfie: json['driver_selfie'] ?? '',
      drivingLicense: json['driving_license'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driver_id': driverId,
      'first_name': firstName,
      'last_name': lastName,
      'dob': dob,
      'state_id': stateId,
      'city_id': cityId,
      'ssn': ssn,
      'bank_account_number': bankAccountNumber,
      'bank_routing_number': bankRoutingNumber,
      'address': address,
      'vehicle_insured': vehicleInsured,  
      'can_lift_40_lb': canLift40Lb,      
      'age_check': ageCheck,             
      'driver_email': driverEmail,
      'driver_password': driverPassword,
      'ccode': countryCode,
      'mobile': mobile,
      'zipcode': zipcode,
      'model': model,
      'make': make,
      'year': year,
      'color': color,
      'register_car': registerCar,        // Send as string (1 or 0)
      'rules_regulation': rulesRegulation,// Send as string (1 or 0)
      'vehicle_photo': vehiclePhoto,
      'driver_selfie': driverSelfie,
      'driving_license': drivingLicense,
    };
  }
}
