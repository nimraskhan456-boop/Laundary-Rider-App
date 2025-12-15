// // // import 'package:deliveryboy/Api/Config.dart';
// // // import 'package:dio/dio.dart';
// // // import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
// // // class Api {
// // //   final Dio _dio = Dio();
// // //   Api() {
// // //     _dio.options.baseUrl = Config.baseUrl;
// // //     _dio.options.headers = {
// // //       'Content-Type': 'application/json',
// // //       'Cookie': 'PHPSESSID=oonu3ro0agbeiik4t0l6egt8ab'
// // //     };
// // //     _dio.options.responseType = ResponseType.plain;
// // //     _dio.interceptors.add(
// // //         PrettyDioLogger(requestBody: true, responseBody: true, error: true));
// // //   }
// // //   Dio get sendRequest => _dio;
// // // }
//
// // // import 'package:dio/dio.dart'; // Importing the Dio package for HTTP requests
// // // import 'package:pretty_dio_logger/pretty_dio_logger.dart'; // Importing a logger for debugging purposes
//
// // // /// Api class to manage HTTP requests using Dio
// // // class Api {
// // //   final Dio _dio; // Private Dio instance
//
// // //   /// Constructor to initialize Dio with default settings
// // //   Api()
// // //       : _dio = Dio(BaseOptions(
// // //           baseUrl: 'https://laundry.saleselevation.tech/driver_api/', // Setting the base URL for all requests
// // //           connectTimeout: Duration(seconds: 30), // Connection timeout duration
// // //           receiveTimeout: Duration(seconds: 30), // Receive timeout duration
// // //           headers: {
// // //             'Content-Type': 'application/json', // Setting the content type to JSON
// // //             'Cookie': 'PHPSESSID=oonu3ro0agbeiik4t0l6egt8ab', // Example cookie header; replace with dynamic value if needed
// // //           },
// // //           responseType: ResponseType.json, // Setting the response type to JSON
// // //         )) {
// // //     // Adding an interceptor for logging request and response details
// // //     _dio.interceptors.add(PrettyDioLogger(
// // //       requestHeader: true, // Log request headers
// // //       requestBody: true, // Log request body
// // //       responseHeader: true, // Log response headers
// // //       responseBody: true, // Log response body
// // //       error: true, // Log errors
// // //       compact: true, // Compact log output
// // //       maxWidth: 90, // Wrap log lines at 90 characters
// // //     ));
// // //   }
//
// // //   /// Reusable GET method
// // //   /// [endpoint] is the API endpoint to be appended to the base URL
// // //   /// [queryParams] are the optional query parameters for the request
// // //   Future<Response> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
// // //     return await _dio.get(endpoint, queryParameters: queryParams);
// // //   }
//
// // //   /// Reusable POST method
// // //   /// [endpoint] is the API endpoint to be appended to the base URL
// // //   /// [data] is the optional data to be sent in the request body
// // //   Future<Response> post(String endpoint, {dynamic data}) async {
// // //     return await _dio.post(endpoint, data: data);
// // //   }
//
// // //   /// Reusable PUT method
// // //   /// [endpoint] is the API endpoint to be appended to the base URL
// // //   /// [data] is the optional data to be sent in the request body
// // //   Future<Response> put(String endpoint, {dynamic data}) async {
// // //     return await _dio.put(endpoint, data: data);
// // //   }
//
// // //   /// Reusable DELETE method
// // //   /// [endpoint] is the API endpoint to be appended to the base URL
// // //   Future<Response> delete(String endpoint) async {
// // //     return await _dio.delete(endpoint);
// // //   }
// // // }
// // // ------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// API class to manage HTTP requests using Dio
class Api {
  final Dio _dio;

  /// Constructor to initialize Dio with default settings
  Api()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://laundry.saleselevation.tech/driver_api/', // ✅ Base URL
          connectTimeout: Duration(seconds: 80),
          receiveTimeout: Duration(seconds: 80),
          headers: {
            'Content-Type': 'application/json', // ✅ Set Content-Type
          },
          responseType: ResponseType.json, // ✅ Expect JSON response
        )) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  /// ✅ Get Dio instance
  Dio get sendRequest => _dio;

  /// ✅ **Reusable GET method (Fixed)**
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams, Options? options}) async {
    return await _dio.get(
      endpoint,
      queryParameters: queryParams,
      options: options, // ✅ Fix: Ensure headers/options are passed properly
    );
  }

  /// ✅ **Reusable POST method**
  Future<Response> post(String endpoint,
      {dynamic data, Options? options}) async {
    return await _dio.post(
      endpoint,
      data: data,
      options: options,
    );
  }

  /// ✅ **Reusable PUT method**
  Future<Response> put(String endpoint,
      {dynamic data, Options? options}) async {
    return await _dio.put(
      endpoint,
      data: data,
      options: options,
    );
  }

  /// ✅ **Reusable DELETE method**
  Future<Response> delete(String endpoint, {Options? options}) async {
    return await _dio.delete(
      endpoint,
      options: options,
    );
  }
}
