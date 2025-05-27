import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api_model/newsapi/news_api_model.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Future<NewsApi> fetchNews() async {
    final url =
        'https://newsdata.io/api/1/latest?apikey=pub_7cce0d16eb114b93aa4139d41e5b1c47&q=https%3A%2F%2Fnewsdata.io%2Fapi%2F1%2Flatest%3Fapikey%3Dpub_7cce0d16eb114b93aa4139d41e5b1c47%26q%3Dnewsapi';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return NewsApi.fromJson(result);
    } else {
      return NewsApi();
    }
  }

  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: fetchNews(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "${snapshot.data!.status![index].toString()}",
                  ),
                ),
                title: Text("${snapshot.data!.status![index].toString()}"),
                subtitle: Text("${snapshot.data!.status![index].toString()}"),
              );
            },
            itemCount: snapshot.data!.status!.length,
          );
        },
      ),
    );
  }
}
