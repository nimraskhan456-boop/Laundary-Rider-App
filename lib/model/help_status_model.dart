class HelpStatusResponse {
  String? responseCode;
  String? result;
  String? responseMsg;

  HelpStatusResponse({this.responseCode, this.result, this.responseMsg});

  factory HelpStatusResponse.fromJson(Map<String, dynamic> json) {
    return HelpStatusResponse(
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
