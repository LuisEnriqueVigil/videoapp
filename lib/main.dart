import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/domain/controllers/nav_controller.dart';
import 'package:mas_uno_test/src/data/apis/get_movie_trending.dart';
import 'package:mas_uno_test/src/data/apis/get_popular_movie.dart';
import 'package:mas_uno_test/src/domain/controllers/profile_controller.dart';
import 'package:mas_uno_test/src/ui/pages/splash/pages/splash_screen.dart';
import 'package:provider/provider.dart';
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> NavController()),
        ChangeNotifierProvider(create: (_)=> GetMovieTrending()),
        ChangeNotifierProvider(create: (_)=> GetPopularMovies()),
        ChangeNotifierProvider(create: (_)=> ProfileController())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieApp',
        home: SplashScreen()
      ),
    );
  }
}