import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
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
                  colorText: Colors.deepPurple),
              const SizedBox(height: 5.0),
              //*integration pagkacge raiting movie
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                   final snackBar =  SnackBar(
                    backgroundColor:(rating >= 3.0 )? 
                       Colors.green :
                       Colors.red,
                    duration:  const Duration(milliseconds: 1000),
                    content:   TextWidgetApp(
                        text: (rating >= 3.0 )? 
                          "Buena película 😁":
                          "Mala película 💀",
                        fontWeight: FontWeight.bold,
                        colorText: Colors.white,
                        textAlign: TextAlign.start,
                        size: 18.0,
                      ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              const SizedBox(height: 5.0),
              const TextWidgetApp(
                  text: "Presiona segun tu parecer",
                  size: 12.0,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                  colorText: Colors.black),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                       TextWidgetApp(
                        text: "Apoya a la pelicula",
                        size: 16.0,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        colorText: Colors.deepPurple
                      ),
                       SizedBox(height: 5.0),
                       TextWidgetApp(
                        text: "Presiona segun el icono para sumar",
                        size: 12.0,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                        colorText: Colors.black),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  LikeButton(
                      size: 60.0,
                      circleColor:
                          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Color(0xff33b5e5),
                        dotSecondaryColor: Color(0xff0099cc),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.handshake_rounded,
                          color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                          size: 30.0,
                        );
                      },
                      likeCount: 100,
                   ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
