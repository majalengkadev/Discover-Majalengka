import 'package:dio/dio.dart';
import 'package:discover_majalengka/helpers/env.dart';
import 'package:discover_majalengka/helpers/rb_helpers.dart';

import 'constants.dart';

enum StatusKoneksi { loading, error, done }

class Api {
  Dio _dio() {
    return Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Env.apiToken}'
      },
    ));
  }

  get(String url,
      {Map<String, String>? params,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) {
    _dio().get('${Env.baseUrl}$url', queryParameters: params).then((response) {
      log(response);

      if (response.statusCode == 200) {
        if (onSuccess != null) onSuccess(response.data);
      } else {
        if (onError != null) onError(response.data['message']);
      }
    }).onError((error, stackTrace) {
      if (onError != null) onError(error.toString());
    });
  }
}
