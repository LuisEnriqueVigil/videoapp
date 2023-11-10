
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/data/apis/get_movie_trending.dart';
import 'package:mas_uno_test/src/domain/models/moviesTrending/response_get_trending_model.dart';
import 'package:mas_uno_test/src/ui/pages/detailContent/pages/detail_content_page.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';
import 'package:provider/provider.dart';

class MoviesTrendingWidget extends StatelessWidget {
  const MoviesTrendingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final getMovieTrendingService = Provider.of<GetMovieTrending>(context);
    
    return SizedBox(
      height: 160.0,
      child: FutureBuilder<List<ResponseGetTrendingMovies>>(
        future: getMovieTrendingService.getMovieTrending(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)? 
              const Center(
                child: SizedBox(
                  width: 40.0,height: 40.0,
                  child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                ),
              )
              :
              ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (snapshot.data?? []).length,
              itemBuilder: (context, index) {
                Random random = Random();
                Color color = Color.fromARGB(
                             255,
                             random.nextInt(256),
                             random.nextInt(256),
                             random.nextInt(256),
                );
                return FadeInLeft(
                  child: InkWell(
                    onTap: ()async{
                      await Future.delayed(const Duration(milliseconds: 100));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailContentPage(
                        titleMovie: snapshot.data?[index].movie.title ?? "", 
                        yearMovie: snapshot.data?[index].movie.year.toString() ?? "", 
                        slugs: snapshot.data?[index].movie.ids.slug?? "", 
                        imdb: snapshot.data?[index].movie.ids.imdb ?? "", 
                        tmdb: snapshot.data?[index].movie.ids.tmdb.toString() ?? "", 
                        trackt: snapshot.data?[index].movie.ids.trakt.toString() ?? "", 
                        colorAppBar: color.withOpacity(0.50)
                      )));
                    },
                    splashColor: Colors.black,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          width: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.5),
                              color: color.withOpacity(0.50),
                              border: Border.all(
                                color: color,
                                width: 2.0
                              )
                           ),
                        ),
                        Positioned(
                          top: 10.0,left: 5.0,
                          child: Container(
                                width: 130.0,
                                padding: const EdgeInsets.only(left: 5.0, top: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: Hero(
                                  tag: snapshot.data?[index].movie.title ?? "" ,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextWidgetApp(
                                        text: snapshot.data?[index].movie.title ?? "",
                                        size: 12.0,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.start,
                                        colorText: Colors.black),
                                  ),
                                ),
                              ),
                        ),
                        Positioned(
                          bottom: 10.0,left: 8.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 10.0),
                                  TextWidgetApp(
                                      text: snapshot.data?[index].watchers.toString() ?? "",
                                      size: 10.0,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.start,
                                      colorText: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      ),
    );
  }
}
