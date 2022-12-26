import 'package:retrofit_test/api/api_client.dart';
import 'package:retrofit_test/model/base_response.dart';
import 'package:retrofit_test/model/quote.dart';

import 'base_service.dart';

class Quotes extends BaseService implements IQuotes {
  Quotes({required RestClient client}) : super(client: client);

  List<dynamic> mResult = [];

  List<dynamic> get quoteList => mResult;

  @override
  Future<void> getQuotes() async {
    try {
      final result = await client.getQuotes();
      mResult = result.results!;
    } catch (e) {
      errorResponse(e);
    }

    notifyListeners();
  }

  Future<Quote> getQuoteById(String id) async {
    final result = await client.getQuoteById(id);

    notifyListeners();
    return result;
  }
}

abstract class IQuotes {
  void getQuotes();
}
