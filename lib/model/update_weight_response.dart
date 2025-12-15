// class UpdateWeightResponse {
//   final String responseCode;
//   final bool result;
//   final String responseMsg;
//
//   UpdateWeightResponse({
//     required this.responseCode,
//     required this.result,
//     required this.responseMsg,
//   });
//
//   factory UpdateWeightResponse.fromJson(Map<String, dynamic> json) {
//     return UpdateWeightResponse(
//       responseCode: json['ResponseCode'],
//       result: json['Result'] == 'true',
//       responseMsg: json['ResponseMsg'],
//     );
//   }
// }
class UpdateWeightResponse {
  final String responseCode;
  final bool result;
  final String responseMsg;

  UpdateWeightResponse({
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  factory UpdateWeightResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWeightResponse(
      responseCode: json['ResponseCode'] ?? '',
      result: json['Result'].toString().toLowerCase() == 'true',
      responseMsg: json['ResponseMsg'] ?? '',
    );
  }
}
