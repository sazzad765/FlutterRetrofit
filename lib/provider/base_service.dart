import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/model/base_response.dart';
import '../api/api_client.dart';

class BaseService {
  // final RestClient _client;
  //
  // BaseService({required RestClient client}) : _client = client;
  //
  // RestClient get client => _client;

  BaseResponse errorResponse(Object obj) {
    switch (obj.runtimeType) {
      case DioError:
        final res = (obj as DioError).response;
        print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
        return BaseResponse(
            type: APIResultType.error, errorMessage: res.statusMessage ?? '');

      default:
        print('Error : $obj');
        return BaseResponse(type: APIResultType.error);
    }
  }
}
