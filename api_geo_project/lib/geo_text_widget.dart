import 'package:flutter/material.dart';

class GeoTextWidget extends StatelessWidget {
  const GeoTextWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        text1,
        style: const TextStyle(fontSize: 16),
      ),
      title: Text(
        text2,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
