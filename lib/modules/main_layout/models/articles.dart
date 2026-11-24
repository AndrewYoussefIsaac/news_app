import 'dart:convert';

NewsResponse articlesFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String articlesToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
    NewsResponse({
        required this.totalResults,
        required this.articles,
        required this.status,
    });

    int totalResults;
    List<Article> articles;
    String status;

    factory NewsResponse.fromJson(Map<dynamic, dynamic> json) => NewsResponse(
        totalResults: json["totalResults"] ?? 0,
        articles: List<Article>.from(
          ((json["articles"] ?? []) as List)
              .map((x) => Article.fromJson(x))
              // NewsAPI returns deleted articles with title "[Removed]" and no data
              .where((article) => article.title != "[Removed]"),
        ),
        status: json["status"] ?? "",
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
    ArticleSource source;
    String title;
    String url;
    String content;

    factory Article.fromJson(Map<dynamic, dynamic> json) => Article(
        // tryParse returns null instead of throwing if the date is missing/invalid
        publishedAt: DateTime.tryParse(json["publishedAt"] ?? "") ?? DateTime.now(),
        author: json["author"],
        urlToImage: json["urlToImage"],
        description: json["description"] ?? "",
        source: ArticleSource.fromJson(json["source"] ?? {}),
        title: json["title"] ?? "",
        url: json["url"] ?? "",
        content: json["content"] ?? "",
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

class ArticleSource {
    ArticleSource({
        required this.name,
        this.id,
    });

    String name;
    String? id;

    factory ArticleSource.fromJson(Map<dynamic, dynamic> json) => ArticleSource(
        name: json["name"] ?? "",
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
