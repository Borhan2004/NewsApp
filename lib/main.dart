import 'package:flutter/material.dart';
import 'package:news_api_model/newsapi/news_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Data'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: NewsApp(),
    );
  }
}
