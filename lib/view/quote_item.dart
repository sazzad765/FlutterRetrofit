import 'package:flutter/material.dart';
import 'package:retrofit_test/model/quote.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key? key, required this.model, required this.onPressed})
      : super(key: key);

  final Quote model;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
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
      ),
    );
  }
}
