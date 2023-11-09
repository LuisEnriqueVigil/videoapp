import 'dart:convert';

import 'package:mas_uno_test/src/domain/models/moviesTrending/movil_movie_trending.dart';

class ResponseGetTrendingMovies {
    final int watchers;
    final Movie movie;

    ResponseGetTrendingMovies({
        required this.watchers,
        required this.movie,
    });

    ResponseGetTrendingMovies copyWith({
        int? watchers,
        Movie? movie,
    }) => 
        ResponseGetTrendingMovies(
            watchers: watchers ?? this.watchers,
            movie: movie ?? this.movie,
        );

    factory ResponseGetTrendingMovies.fromRawJson(String str) => ResponseGetTrendingMovies.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponseGetTrendingMovies.fromJson(Map<String, dynamic> json) => ResponseGetTrendingMovies(
        watchers: json["watchers"],
        movie: Movie.fromJson(json["movie"]),
    );

    Map<String, dynamic> toJson() => {
        "watchers": watchers,
        "movie": movie.toJson(),
    };
}
