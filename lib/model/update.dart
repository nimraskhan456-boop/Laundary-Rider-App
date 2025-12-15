class UpdateResponse {
  String? responseCode;
  String? result;
  String? responseMsg;

  UpdateResponse({this.responseCode, this.result, this.responseMsg});

  factory UpdateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResponse(
      responseCode: json['ResponseCode'],
      result: json['Result'],
      responseMsg: json['ResponseMsg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ResponseCode': responseCode,
      'Result': result,
      'ResponseMsg': responseMsg,
    };
  }
}
