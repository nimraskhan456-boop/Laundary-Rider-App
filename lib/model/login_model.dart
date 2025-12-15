class LoginModel {
  String? responseCode;
  String? result;
  String? responseMsg;
  DriverDetails? driverDetails;

  LoginModel(
      {this.responseCode, this.result, this.responseMsg, this.driverDetails});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      responseCode: json['ResponseCode'],
      result: json['Result'],
      responseMsg: json['ResponseMsg'],
      driverDetails: json['DriverDetails'] != null
          ? DriverDetails.fromJson(json['DriverDetails'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ResponseCode': responseCode,
      'Result': result,
      'ResponseMsg': responseMsg,
      'DriverDetails': driverDetails?.toJson(),
    };
  }
}

class DriverDetails {
  String? driverId;
  String? driverName;
  String? driverEmail;
  String? driverPhone;
  String? securityToken;

  DriverDetails(
      {this.driverId,
      this.driverName,
      this.driverEmail,
      this.driverPhone,
      this.securityToken});

  factory DriverDetails.fromJson(Map<String, dynamic> json) {
    return DriverDetails(
      driverId: json['driver_id'],
      driverName: json['driver_name'],
      driverEmail: json['driver_email'],
      driverPhone: json['driver_phone'],
      securityToken: json['security_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driver_id': driverId,
      'driver_name': driverName,
      'driver_email': driverEmail,
      'driver_phone': driverPhone,
      'security_token': securityToken,
    };
  }
}
