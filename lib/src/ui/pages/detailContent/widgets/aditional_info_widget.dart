import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';


class AditionalInfoWidget extends StatelessWidget {
  const AditionalInfoWidget({
    super.key,
    required this.slugs,
    required this.yearMovie,
    required this.trackt,
    required this.imdb,
    required this.tmdb,
  });

  final String slugs;
  final String yearMovie;
  final String trackt;
  final String imdb;
  final String tmdb;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30.0),
        const TextWidgetApp(
            text: "Información adicional: ",
            size: 16.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            colorText: Colors.deepPurple
        ),
        const SizedBox(height: 15.0),
        TextWidgetApp(
            text: "Slug Movie: $slugs",
            size: 14.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            colorText: Colors.black
        ),
        const SizedBox(height: 10.0),
        TextWidgetApp(
            text: "Año de estreno : $yearMovie",
            size: 14.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            colorText: Colors.black
        ),
        const SizedBox(height: 10.0),
        TextWidgetApp(
            text: "Trakt: $trackt",
            size: 14.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            colorText: Colors.black
        ),
        const SizedBox(height: 10.0),
        TextWidgetApp(
            text: "IMDB: $imdb",
            size: 14.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            colorText: Colors.black
        ),
        const SizedBox(height: 10.0),
        TextWidgetApp(
            text: "TMDB: $tmdb",
            size: 14.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            colorText: Colors.black
        ),
      ],
    );
  }
}
