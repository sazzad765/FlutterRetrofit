import 'package:flutter/cupertino.dart';
import 'package:retrofit_test/api/api_client.dart';
import 'package:retrofit_test/model/base_response.dart';
import 'package:retrofit_test/model/quote.dart';

import 'base_service.dart';

class Quotes extends ChangeNotifier with BaseService {
  final RestClient _client;
  Quotes({required RestClient client}) : _client = client;

  List<Quote> mResult = [];

  List<Quote> get quoteList => mResult;

  Future<BaseResponse<dynamic>> getQuotes() async {
    BaseResponse<dynamic> result;
    try {
      result = await _client.getQuotes();
      mResult = result.results!;
    } catch (e) {
      result = errorResponse(e);
    }finally{

    }
    notifyListeners();
    return result;
  }

  Future<Quote> getQuoteById(String id) async {
    final result = await _client.getQuoteById(id);

    notifyListeners();
    return result;
  }
}
