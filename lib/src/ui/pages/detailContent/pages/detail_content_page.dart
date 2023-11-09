import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/pages/detailContent/widgets/aditional_info_widget.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';

class DetailContentPage extends StatelessWidget {
  final String titleMovie;
  final String yearMovie;
  final String slugs;
  final String imdb;
  final String tmdb;
  final String trackt;
  final Color colorAppBar;

  const DetailContentPage(
      {super.key,
      required this.titleMovie,
      required this.yearMovie,
      required this.slugs,
      required this.imdb,
      required this.tmdb,
      required this.trackt,
      required this.colorAppBar});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorAppBar,
          title: Hero(
            tag: titleMovie,
            child: Material(
              color: Colors.transparent,
              child: TextWidgetApp(
                  text: titleMovie,
                  size: 16.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  colorText: Colors.black),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AditionalInfoWidget(
                  slugs: slugs,
                  yearMovie: yearMovie,
                  trackt: trackt,
                  imdb: imdb,
                  tmdb: tmdb),
              const SizedBox(height: 20.0),
              const TextWidgetApp(
                  text: "Califica la pelicula",
                  size: 16.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  colorText: Colors.deepPurple
              ),
              //*integration pagkacge raiting movie
            ],
          ),
        ),
      ),
    );
  }
}
