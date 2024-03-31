import 'dart:convert';
import 'dart:developer';
import 'package:api_news/pages/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<NewsModel?> fetchData() async {
    try {
      final http = Client();
      final url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=eccaa8e6de5b4250b36e1a9c56a983b4');
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        final newsModel = NewsModel.fromJson(body["articles"][0]);
        return newsModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NEWS APP API')),
      body: Center(
        child: FutureBuilder<NewsModel?>(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<NewsModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            } else if (snapshot.hasData) {
              final newsModel = snapshot.data!;
              return Card(
                child: ListTile(
                  title: Text(newsModel.title),
                  subtitle: Text(newsModel.description),
                  trailing:
                      Image.network(newsModel.urlToImage), // Handle null data
                ),
              );
            } else {
              return const Center(child: Text('maalymat jok'));
            }
          },
        ),
      ),
    );
  }
}
