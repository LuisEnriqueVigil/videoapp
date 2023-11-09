
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/env/client_id_api.dart';
import 'package:mas_uno_test/src/env/url_base_api.dart';
import 'package:http/http.dart' as http;
import 'package:mas_uno_test/src/domain/models/moviesTrending/response_get_trending_model.dart';

class GetMovieTrending with ChangeNotifier{

  bool _loadingGetMovieTrending = false; 

  bool get loadingGetMovieTrending => _loadingGetMovieTrending;
  set loadingGetMovieTrending (bool valor){
    _loadingGetMovieTrending = valor;
    notifyListeners();
  }

  Future <List<ResponseGetTrendingMovies>> getMovieTrending (
  ) async{
    final url = Uri.https( urlBase, "/movies/trending");
    final resp = await http.get(
       url,
       headers: {
        "Content-Type":"application/json",
         "trakt-api-version": "2",
         "trakt-api-key": clientIdApi
       },
    ).timeout(
       const Duration(seconds: 5),
       onTimeout: (){
         return http.Response("Error",408);
       }
     ); 
    print(resp.statusCode);
    print(resp.body);
    if(resp.statusCode == 200){
      List<ResponseGetTrendingMovies> movies = List<ResponseGetTrendingMovies>.from(json.decode((resp.body)).map((x) => ResponseGetTrendingMovies.fromJson(x)));
      return movies;
    }
    else{
      return [];
    }
  }
}