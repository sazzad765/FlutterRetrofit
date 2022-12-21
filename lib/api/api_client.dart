import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_test/model/base_model.dart';
import 'package:retrofit_test/model/quote.dart';
import 'package:retrofit_test/model/response_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.quotable.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/quotes")
  Future<BaseModelList<Quote>> getQuotes();

  @GET("/quotes/{id}")
  Future<Quote> getQuoteById(@Path("id") String id);
}
