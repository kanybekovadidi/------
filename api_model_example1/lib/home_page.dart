import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiModel? apiModel;

  void api() {}

  Future<void> fetchData() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        apiModel = ApiModel(
          albumId: response.data[0]['userId'],
          id: response.data[0]['id'],
          title: response.data[0]['title'],
          body: response.data[0]['body'],
        );
      });
    } else {
      log('error: stattusCode ${response.statusCode}');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API")),
      //// ListView -- berilgen koddordu tizip beret
      ///
      //// ListTile --
      //// Card -- karta syaktuu
      // leading: solgo
      // tTitle: jogoruga
      // subtitle: astyna
      // trailing: ongo chygarat
      body: apiModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              // shrinkWrap: true,
              // scrollDirection: Axis.horizontal, tuurasynan scrol kylat.
              itemCount: 7,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text('${apiModel!.albumId}'),
                    title: Text('${apiModel!.id}'),
                    subtitle: Text(apiModel!.title),
                    // trailing: Text('${apiModel!.body}'),
                  ),
                );
              },
            ),
    );
  }
}
