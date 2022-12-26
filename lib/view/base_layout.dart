import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  final String title;
  final Future<Object?>? future;
  final Widget body;

  const BaseLayout(
      {Key? key, required this.title, this.future, required this.body})
      : super(key: key);

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
           return widget.body;
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
