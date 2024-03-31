import 'dart:developer';

import 'package:api_project_example/photos_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> photosData = [];

  Future<void> fetchData() async {
    final diopaket = Dio();
    final response =
        await diopaket.get('https://jsonplaceholder.typicode.com/photos');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // log(response.data.toString());
      for (var element in response.data) {
        final diana = PhotosModel.fromJson(element);
        log('data image:${diana.url}');
        photosData.add(diana);
      }
    } else {
      log('${response.statusCode}');
      log('${response.statusMessage}');
    }
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api'),
      ),
      body: photosData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final item = photosData[index];
                return Card(
                  child: ListTile(
                    title: Text('${item.albumId}'),
                    leading: Text('${item.id}'),
                    subtitle: Text(item.title),
                    trailing: Image.network(
                      "https://avatars.mds.yandex.net/i?id=b28246139fd92c6079f6c195ee7c38a565a5225a-12260990-images-thumbs&n=13",
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
