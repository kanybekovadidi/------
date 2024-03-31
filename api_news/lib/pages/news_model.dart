import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  NewsModel({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });
  final String id;
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'content': content,
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['source']['id'] as String,
      name: json['source']['name'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      content: json['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
