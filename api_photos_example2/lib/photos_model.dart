// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhotosModel {
  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotosModel.fromMap(String source) =>
      PhotosModel.fromJson(json.decode(source) as Map<String, dynamic>);
}
