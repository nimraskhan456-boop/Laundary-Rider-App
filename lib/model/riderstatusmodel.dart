class StatusUpdateResponse {
final int responseCode;
final bool result;
final String responseMsg;

StatusUpdateResponse({
  required this.responseCode,
  required this.result,
  required this.responseMsg,
});

factory StatusUpdateResponse.fromJson(Map<String, dynamic> json) {
return StatusUpdateResponse(
responseCode: json['ResponseCode'],
result: json['Result'],
responseMsg: json['ResponseMsg'],
);
}
@override
String toString() {
  return 'ResponseCode: $responseCode, Result: $result, Message: $responseMsg';
}
}
