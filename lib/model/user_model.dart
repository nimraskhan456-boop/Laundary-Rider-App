class DriverLoginResponse {
  final String? responseCode;
  final String? result;
  final String? responseMsg;
  final DriverDetails? driverDetails;

  DriverLoginResponse({
    this.responseCode,
    this.result,
    this.responseMsg,
    this.driverDetails,
  });

  factory DriverLoginResponse.fromJson(Map<String, dynamic> json) {
    return DriverLoginResponse(
      responseCode: json['ResponseCode'],
      result: json['Result'],
      responseMsg: json['ResponseMsg'],
      driverDetails: json['DriverDetails'] != null
          ? DriverDetails.fromJson(json['DriverDetails'])
          : null,
    );
  }
}

class DriverDetails {
  final String? driverId;
  final String? driverName;
  final String? driverEmail;
  final String? securityToken;

  DriverDetails({
    this.driverId,
    this.driverName,
    this.driverEmail,
    this.securityToken,
  });

  factory DriverDetails.fromJson(Map<String, dynamic> json) {
    return DriverDetails(
      driverId: json['driver_id'],
      driverName: json['driver_name'],
      driverEmail: json['driver_email'],
      securityToken: json['security_token'],
    );
  }
}

class DriverRegistrationResponse {
  final String? status;
  final String? message;

  DriverRegistrationResponse({this.status, this.message});

  factory DriverRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return DriverRegistrationResponse(
      status: json['status'],
      message: json['message'],
    );
  }
}
