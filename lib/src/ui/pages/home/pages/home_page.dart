import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/pages/home/widget/movies_trending_widget.dart';
import 'package:mas_uno_test/src/ui/pages/home/widget/popular_movies_widget.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(
                height: size.height*0.10,
              ),
              const TextWidgetApp(
                   text: "Peliculas en tendencia",
                   size: 14.0,
                   fontWeight: FontWeight.bold,
                   textAlign: TextAlign.start,
                   colorText: Colors.black),
              const SizedBox(height: 10.0),
              const MoviesTrendingWidget(),
              const SizedBox(height: 20.0),
              const TextWidgetApp(
                  text: "Peliculas populares",
                  size: 14.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  colorText: Colors.black),
              const SizedBox(height: 10.0),
              const PopularMovies()
            ],
          ),
        ),
      ),
    );
  }
}
