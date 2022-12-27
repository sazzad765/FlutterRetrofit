import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final data =
        options.data == null ? {} : options.data as Map<String, dynamic>;
    // data.putIfAbsent('token', () => 'asvdsbdf234567jhbddsfv');
    // data.putIfAbsent('user_id', () => '12309');
    return handler.next(options.copyWith(data: data));
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
