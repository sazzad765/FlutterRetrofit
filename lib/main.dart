import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_test/api/api_client.dart';
import 'package:retrofit_test/provider/interceptors.dart';
import 'package:retrofit_test/provider/quotes.dart';
import 'package:retrofit_test/view/quote/home.dart';

void main() {

  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

 class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();


}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final client = RestClient(Dio(BaseOptions(contentType: "application/json"))
      ..interceptors.add(CustomInterceptors()));

    return MultiProvider(

      providers: [
        // Provider(create: (_) => BaseService(client:client)),
        Provider(create: (_) => Quotes(client:client))
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage()),

    );
  }
}
