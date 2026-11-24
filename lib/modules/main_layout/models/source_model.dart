import 'dart:convert';

SourceResponse sourceModelFromJson(String str) => SourceResponse.fromJson(json.decode(str));

String sourceModelToJson(SourceResponse data) => json.encode(data.toJson());

class SourceResponse {
    SourceResponse({
        required this.sources,
        required this.status,
    });

    List<Source> sources;
    String status;

    factory SourceResponse.fromJson(Map<dynamic, dynamic> json) => SourceResponse(
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

enum Category { general , business , technology , sports , entertainment , health , science }

final categoryValues = EnumValues({
    "business": Category.business ,
    "entertainment": Category.entertainment ,
    "general": Category.general ,
    "health": Category.health ,
    "science": Category.science ,
    "sports": Category.sports ,
    "technology": Category.technology ,
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
