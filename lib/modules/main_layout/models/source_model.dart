/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

SourceModel sourceModelFromJson(String str) => SourceModel.fromJson(json.decode(str));

String sourceModelToJson(SourceModel data) => json.encode(data.toJson());

class SourceModel {
    SourceModel({
        required this.sources,
        required this.status,
    });

    List<Source> sources;
    String status;

    factory SourceModel.fromJson(Map<dynamic, dynamic> json) => SourceModel(
        sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
        "status": status,
    };
}

class Source {
    Source({
        required this.country,
        required this.name,
        required this.description,
        required this.language,
        required this.id,
        required this.category,
        required this.url,
    });

    String country;
    String name;
    String description;
    String language;
    String id;
    Category category;
    String url;

    factory Source.fromJson(Map<dynamic, dynamic> json) => Source(
        country: json["country"],
        name: json["name"],
        description: json["description"],
        language: json["language"],
        id: json["id"],
        category: categoryValues.map[json["category"]]!,
        url: json["url"],
    );

    Map<dynamic, dynamic> toJson() => {
        "country": country,
        "name": name,
        "description": description,
        "language": language,
        "id": id,
        "category": categoryValues.reverse[category],
        "url": url,
    };
}

enum Category { GENERAL, BUSINESS, TECHNOLOGY, SPORTS, ENTERTAINMENT, HEALTH, SCIENCE }

final categoryValues = EnumValues({
    "business": Category.BUSINESS,
    "entertainment": Category.ENTERTAINMENT,
    "general": Category.GENERAL,
    "health": Category.HEALTH,
    "science": Category.SCIENCE,
    "sports": Category.SPORTS,
    "technology": Category.TECHNOLOGY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
