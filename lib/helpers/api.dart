import 'package:dio/dio.dart';

import 'constants.dart';

enum StatusKoneksi { loading, error, done }

class Api {
  Dio _dio() {
    return Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $apiToken'
      },
    ));
  }

  Future<dynamic> get(String url, {Map<String, String>? params}) async {
    try {
      final response =
          await _dio().get('$baseUrl$url', queryParameters: params);
      print(response);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.data['message']);
      }
    } on DioError catch (e) {
      //print("error catch: $e");
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        var pesan = e.response?.data['message'].replaceAll("Exception:", "");
        if (pesan.isEmpty) {
          pesan = e.response?.statusMessage?.replaceAll("Exception:", "");
        }

        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
        throw Exception(pesan);
      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);
        //throw Exception(e.message);
      }
    }
  }

  getx(String url,
      {Map<String, String>? params,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) {
    _dio().get('$baseUrl$url', queryParameters: params).then((response) {
      if (onSuccess != null) onSuccess(response.data);
    }).onError((error, stackTrace) {
      //print("lewat respon error get : $error");
      if (onError != null) onError(error);
    });
  }
}
