/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
    Articles({
        required this.totalResults,
        required this.articles,
        required this.status,
    });

    int totalResults;
    List<Article> articles;
    String status;

    factory Articles.fromJson(Map<dynamic, dynamic> json) => Articles(
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "status": status,
    };
}

class Article {
    Article({
        required this.publishedAt,
        this.author,
        this.urlToImage,
        required this.description,
        required this.source,
        required this.title,
        required this.url,
        required this.content,
    });

    DateTime publishedAt;
    String? author;
    String? urlToImage;
    String description;
    Source source;
    String title;
    String url;
    String content;

    factory Article.fromJson(Map<dynamic, dynamic> json) => Article(
        publishedAt: DateTime.parse(json["publishedAt"]),
        author: json["author"],
        urlToImage: json["urlToImage"],
        description: json["description"],
        source: Source.fromJson(json["source"]),
        title: json["title"],
        url: json["url"],
        content: json["content"],
    );

    Map<dynamic, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "author": author,
        "urlToImage": urlToImage,
        "description": description,
        "source": source.toJson(),
        "title": title,
        "url": url,
        "content": content,
    };
}

class Source {
    Source({
        required this.name,
        this.id,
    });

    String name;
    String? id;

    factory Source.fromJson(Map<dynamic, dynamic> json) => Source(
        name: json["name"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
