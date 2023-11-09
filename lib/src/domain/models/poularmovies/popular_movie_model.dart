
import 'dart:convert';

class ResponsePopularMovie {
    final String title;
    final int year;
    final Ids ids;

    ResponsePopularMovie({
        required this.title,
        required this.year,
        required this.ids,
    });

    ResponsePopularMovie copyWith({
        String? title,
        int? year,
        Ids? ids,
    }) => 
        ResponsePopularMovie(
            title: title ?? this.title,
            year: year ?? this.year,
            ids: ids ?? this.ids,
        );

    factory ResponsePopularMovie.fromRawJson(String str) => ResponsePopularMovie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponsePopularMovie.fromJson(Map<String, dynamic> json) => ResponsePopularMovie(
        title: json["title"],
        year: json["year"],
        ids: Ids.fromJson(json["ids"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "ids": ids.toJson(),
    };
}

class Ids {
    final int trakt;
    final String slug;
    final String imdb;
    final int tmdb;

    Ids({
        required this.trakt,
        required this.slug,
        required this.imdb,
        required this.tmdb,
    });

    Ids copyWith({
        int? trakt,
        String? slug,
        String? imdb,
        int? tmdb,
    }) => 
        Ids(
            trakt: trakt ?? this.trakt,
            slug: slug ?? this.slug,
            imdb: imdb ?? this.imdb,
            tmdb: tmdb ?? this.tmdb,
        );

    factory Ids.fromRawJson(String str) => Ids.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        trakt: json["trakt"],
        slug: json["slug"],
        imdb: json["imdb"],
        tmdb: json["tmdb"],
    );

    Map<String, dynamic> toJson() => {
        "trakt": trakt,
        "slug": slug,
        "imdb": imdb,
        "tmdb": tmdb,
    };
}
