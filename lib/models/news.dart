import 'package:intl/intl.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    this.author = 'No author provided',
    required this.title,
    this.description = 'No description provided',
    required this.url,
    this.urlToImage = 'https://via.placeholder.com/150',
    required this.publishedAt,
    this.content = 'No content provided',
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'No author provided',
        title: json["title"],
        description: json["description"] ?? 'No description provided',
        url: json["url"],
        urlToImage: json["urlToImage"] ?? 'https://via.placeholder.com/150',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'No content provided',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };

  String get formattedDate {
    final DateFormat formatter = DateFormat('dd MMM yy, HH:mm');
    return formatter.format(publishedAt);
  }
}

class Source {
  String id;
  String name;

  Source({
    this.id = 'No ID provided',
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? 'No ID provided',
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
