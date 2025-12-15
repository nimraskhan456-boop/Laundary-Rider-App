class RiderUpdateResponse {
  final String responseCode;
  final String result;
  final String responseMsg;

  RiderUpdateResponse({
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  factory RiderUpdateResponse.fromJson(Map<String, dynamic> json) {
    return RiderUpdateResponse(
      responseCode: json['ResponseCode'] ?? '',
      result: json['Result'] ?? '',
      responseMsg: json['ResponseMsg'] ?? '',
    );
  }
}
