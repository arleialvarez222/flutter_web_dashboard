

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {

  static final Dio _dio = Dio();

  static void configureDio(){

    //base  del url
    _dio.options.baseUrl = ('http://localhost:8080/api');

    //headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet( String path) async {

    try {

      final resp = await _dio.get(path);

      return resp.data;

    } on DioError catch (e) {

      // ignore: avoid_print
      print(e.response);
      throw('Error en el get');
      
    }
  }

  static Future post( String path, Map<String, dynamic> data) async {

    final formData = FormData.fromMap(data);

    try {

      final resp = await _dio.post(path, data:formData );

      return resp.data;

    } on DioError catch (e) {

      // ignore: avoid_print
      print(e.response);
      throw('Error en el post');

    }
  }

  static Future put( String path, Map<String, dynamic> data) async {

    final formData = FormData.fromMap(data);

    try {

      final resp = await _dio.put(path, data:formData );

      return resp.data;

    } on DioError catch (e) {

      // ignore: avoid_print
      print(e.response);
      throw('Error en el put');

    }
  }

  static Future delete( String path, Map<String, dynamic> data) async {

    final formData = FormData.fromMap(data);

    try {

      final resp = await _dio.delete(path, data:formData );

      return resp.data;

    } on DioError catch (e) {

      // ignore: avoid_print
      print(e.response);
      throw('Error en el delete');

    }
  }
  
}