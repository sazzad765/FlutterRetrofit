import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/model/quote.dart';
import 'package:retrofit_test/provider/quotes.dart';
import 'package:retrofit_test/view/quote/quote_item.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<QuoteDetails> createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<Quotes>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: FutureBuilder<Quote>(
          future: dataProvider.getQuoteById(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final _quotes = snapshot.data;
              return _details(_quotes ?? Quote());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  _details(Quote model) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Wrap(
                  spacing: 5,
                  children: [
                    for (var tag in model.tags ?? [])
                      Chip(
                        label: Text(tag),
                        labelPadding:
                        const EdgeInsets.symmetric(horizontal: 15),
                        backgroundColor: Colors.deepPurple.shade200,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  model.content ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Author: ${model.author}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
