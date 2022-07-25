// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:dio/adapter.dart';
//
//
// class DioHelper{
//
//   static Dio? dio;
//
//
//   static init(){
//    dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://student.valuxapps.com/api/',
//         receiveDataWhenStatusError: true,
//       )
//     );
//    (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//        (HttpClient client) {
//      client.badCertificateCallback =
//          (X509Certificate cert, String host, int port) => true;
//      return client;
//    };
//
//   }
//
//   static Future<Response> getData({
//     required String url,
//     Map<String, dynamic>? query,
//     String lang = 'ar',
//     String? token,
// }) async {
//     dio?.options.headers = {
//       'lang': lang,
//       'Authorization': token,
//       'Content-Type' : 'application/json'
//     };
//     return await dio!.get(url, queryParameters: query);
//   }
//
//   static Future<Response> postData(
//   {
//     required String url,
//     Map<String, dynamic>? query,
//     required Map<String, dynamic>? data,
//     String lang = 'ar',
//     String? token,
// }) async {
//     dio?.options.headers = {
//       'lang': lang,
//       'Authorization': token,
//       'Content-Type' : 'application/json'
//     };
//     return await dio!.post(url, queryParameters: query, data: data);
//   }
//
//   static Future<Response> putData(
//       {
//         required String url,
//         Map<String, dynamic>? query,
//         required Map<String, dynamic>? data,
//         String lang = 'ar',
//         String? token,
//       }) async {
//     dio?.options.headers = {
//       'lang': lang,
//       'Authorization': token,
//       'Content-Type' : 'application/json'
//     };
//     return await dio!.put(url, queryParameters: query, data: data);
//   }
// }