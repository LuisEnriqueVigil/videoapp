import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/domain/controllers/nav_controller.dart';
import 'package:mas_uno_test/src/data/apis/get_movie_trending.dart';
import 'package:mas_uno_test/src/data/apis/get_popular_movie.dart';
import 'package:mas_uno_test/src/ui/pages/login/pages/login_page.dart';
import 'package:provider/provider.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> NavController()),
        ChangeNotifierProvider(create: (_)=> GetMovieTrending()),
        ChangeNotifierProvider(create: (_)=> GetPopularMovies())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieApp',
        home: LoginPage()
      ),
    );
  }
}