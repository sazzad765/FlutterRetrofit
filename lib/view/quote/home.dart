import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/provider/quotes.dart';
import 'package:retrofit_test/view/base_layout.dart';
import 'package:retrofit_test/view/quote/quote_details.dart';
import 'package:retrofit_test/view/quote/quote_item.dart';

class MyHomePage extends BasePage<MyHomePage> {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

abstract class BasePage<T> extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  void baseShowSuccess() {
    //SnackBar.createAnimationController(vsync: vsync)
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<Quotes>(context);

    final _quotes = dataProvider.quoteList;
    return BaseLayout(
        title: 'Home',
        future: dataProvider.getQuotes(),
        body: ListView.builder(
          itemCount: _quotes.length,
          itemBuilder: (context, index) {
            final _item = _quotes[index];
            return QuoteWidget(
              model: _item,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuoteDetails(id: _item.id ?? '')),
                );
              },
            );
          },
        ));
  }
}
