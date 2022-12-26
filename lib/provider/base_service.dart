import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import '../api/api_client.dart';

class BaseService extends ChangeNotifier  {
  final RestClient _client;

  BaseService({required RestClient client}) : _client = client;

  RestClient get client => _client;

  void errorResponse(Object obj) {
    switch (obj.runtimeType) {
      case DioError:
        final res = (obj as DioError).response;
        print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
        break;
      default:
        print('Error : $obj');
        break;
    }
  }


}