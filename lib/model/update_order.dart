// class UpdateOrderResponse {
//   String? responseCode;
//   String? result;
//   String? title;
//   int? orderId;
//   String? orderStatus;

//   UpdateOrderResponse(
//       {this.responseCode,
//       this.result,
//       this.title,
//       this.orderId,
//       this.orderStatus});

//   UpdateOrderResponse.fromJson(Map<String, dynamic> json) {
//     responseCode = json['ResponseCode'];
//     result = json['Result'];
//     title = json['title'];
//     orderId = json['order_id'];
//     orderStatus = json['order_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ResponseCode'] = this.responseCode;
//     data['Result'] = this.result;
//     data['title'] = this.title;
//     data['order_id'] = this.orderId;
//     data['order_status'] = this.orderStatus;
//     return data;
//   }
// }
// class UpdateOrderResponse {
//   String? responseCode;
//   String? result;
//   String? title;
//   int? orderId;
//   String? orderStatus;
//
//   UpdateOrderResponse({
//     this.responseCode,
//     this.result,
//     this.title,
//     this.orderId,
//     this.orderStatus,
//   });
//
//   UpdateOrderResponse.fromJson(Map<String, dynamic> json) {
//     responseCode = json['ResponseCode']?.toString();
//     result = json['Result']?.toString();
//     title = json['title']?.toString();
//     orderId = int.tryParse(json['order_id']?.toString() ?? '');
//     orderStatus = json['order_status']?.toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['ResponseCode'] = responseCode;
//     data['Result'] = result;
//     data['title'] = title;
//     data['order_id'] = orderId;
//     data['order_status'] = orderStatus;
//     return data;
//   }
// }
//////////////
class UpdateOrderResponse {
  String? responseCode;
  String? result;
  String? title;
  int? orderId;
  String? message; // <-- add this for updated API 'message'

  UpdateOrderResponse({
    this.responseCode,
    this.result,
    this.title,
    this.orderId,
    this.message,
  });

  UpdateOrderResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode']?.toString();
    result = json['Result']?.toString();
    title = json['title']?.toString();
    orderId = int.tryParse(json['order_id']?.toString() ?? '');
    message = json['message']?.toString(); // <-- new
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ResponseCode'] = responseCode;
    data['Result'] = result;
    data['title'] = title;
    data['order_id'] = orderId;
    data['message'] = message; // <-- new
    return data;
  }
}
