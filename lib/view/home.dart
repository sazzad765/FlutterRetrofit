import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/provider/quotes.dart';
import 'package:retrofit_test/view/quote_details.dart';
import 'package:retrofit_test/view/quote_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<Quotes>(context);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: FutureBuilder<dynamic>(
          future: dataProvider.getQuotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final _quotes = dataProvider.quoteList;
              return Column(
                children: [
                  // Text('${snapshot.data.count}'),
                  Expanded(
                      child: ListView.builder(
                    itemCount: _quotes.length,
                    itemBuilder: (context, index) {
                      final _item = _quotes[index];
                      return QuoteWidget(
                        model: _item,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuoteDetails(id: _item.id ?? '')),
                          );
                        },
                      );
                    },
                  ))
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
