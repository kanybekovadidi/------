import 'package:api_geo_project/geo_model.dart';
import 'package:api_geo_project/geo_text_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GeoModel? geoModel;

  Future<GeoModel?> fetchData() async {
    final paketdio = Dio();
    final response = await paketdio.get('https://ipinfo.io/161.185.160.93/geo');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // setState(() {
      //   geoModel = GeoModel.fromJson(response.data);
      // });
      return GeoModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GEO API'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return Card(
              child: Column(children: [
                GeoTextWidget(
                  text1: 'ip:',
                  text2: data!.ip,
                ),
                GeoTextWidget(
                  text1: 'city:',
                  text2: data.city,
                ),
                GeoTextWidget(
                  text1: 'region:',
                  text2: data.region,
                ),
                GeoTextWidget(
                  text1: 'country:',
                  text2: data.country,
                ),
                GeoTextWidget(
                  text1: 'loc:',
                  text2: data.loc,
                ),
                GeoTextWidget(
                  text1: 'org:',
                  text2: data.org,
                ),
                GeoTextWidget(
                  text1: 'postal:',
                  text2: data.postal,
                ),
                GeoTextWidget(
                  text1: 'timezone:',
                  text2: data.timezone,
                ),
                GeoTextWidget(
                  text1: 'readme:',
                  text2: data.readme,
                ),
              ]),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Kata bar'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // body: geoModel == null
      //     ? const Center(child: CircularProgressIndicator())
      //     : Card(
      //         child: Column(children: [
      //           GeoTextWidget(
      //             text1: 'ip:',
      //             text2: geoModel!.ip,
      //           ),
      //           GeoTextWidget(
      //             text1: 'city:',
      //             text2: geoModel!.city,
      //           ),
      //           GeoTextWidget(
      //             text1: 'region:',
      //             text2: geoModel!.region,
      //           ),
      //           GeoTextWidget(
      //             text1: 'country:',
      //             text2: geoModel!.country,
      //           ),
      //           GeoTextWidget(
      //             text1: 'loc:',
      //             text2: geoModel!.loc,
      //           ),
      //           GeoTextWidget(
      //             text1: 'org:',
      //             text2: geoModel!.org,
      //           ),
      //           GeoTextWidget(
      //             text1: 'postal:',
      //             text2: geoModel!.postal,
      //           ),
      //           GeoTextWidget(
      //             text1: 'timezone:',
      //             text2: geoModel!.timezone,
      //           ),
      //           GeoTextWidget(
      //             text1: 'readme:',
      //             text2: geoModel!.readme,
      //           ),
      //         ]),
      //       ),
    );
  }
}
