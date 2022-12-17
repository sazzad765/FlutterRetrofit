import 'package:flutter/cupertino.dart';
import 'package:retrofit_test/api/api_client.dart';
import 'package:retrofit_test/model/quote.dart';
import 'package:retrofit_test/model/base_model.dart';

class Quotes extends ChangeNotifier {
  final RestClient _client;
  Quotes({required RestClient client}) : _client = client;

  List<Quote> _quoteList = [];

  List<Quote> get quoteList => _quoteList;

  Future<BaseModelList<Quote>> getQuotes() async {
    final result = await _client.getQuotes();
    _quoteList = result.results!;
    notifyListeners();
    return result;
  }

  Future<Quote> getQuoteById(String id) async {
    final result = await _client.getQuoteById(id);
    notifyListeners();
    return result;
  }
}
