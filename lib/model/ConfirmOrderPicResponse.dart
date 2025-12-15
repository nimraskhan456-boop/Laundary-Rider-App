class ConfirmOrderPicResponse {
  final String responseCode;
  final String result;
  final String responseMsg;

  ConfirmOrderPicResponse({
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  factory ConfirmOrderPicResponse.fromJson(Map<String, dynamic> json) {
    return ConfirmOrderPicResponse(
      responseCode: json['ResponseCode'] ?? '',
      result: json['Result'] ?? '',
      responseMsg: json['ResponseMsg'] ?? '',
    );
  }
}
