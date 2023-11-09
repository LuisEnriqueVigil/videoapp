import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/data/apis/get_popular_movie.dart';
import 'package:mas_uno_test/src/domain/models/poularmovies/popular_movie_model.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';
import 'package:provider/provider.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final getPopularMovie = Provider.of<GetPopularMovies>(context);
    
    return Expanded(
      child: FutureBuilder<List<ResponsePopularMovie>>(
        future: getPopularMovie.getPopularMovies(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)?
           const Center(
             child: SizedBox(
              height: 40.0,width: 40.0,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
              ),
           )
           :
           GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,  
            itemCount: (snapshot.data??[]).length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,  
                mainAxisSpacing: 0.2,
                mainAxisExtent: 120, 
            ), 
            itemBuilder: (context,index){
              Random random = Random();
              Color color = Color.fromARGB(
                 255,
                 random.nextInt(256),
                 random.nextInt(256),
                 random.nextInt(256),
               ).withOpacity(0.50);
              return Stack(
                children: [
                  Container(
                    width: 100.0,
                    margin: const EdgeInsets.only(right: 5.0,bottom: 5.0),
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
                     padding: const EdgeInsets.all(2.5),
                      width:68.0 ,
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: TextWidgetApp(
                       text: snapshot.data?[index].title ?? "",
                       size: 10.0,
                       fontWeight: FontWeight.bold,
                       textAlign: TextAlign.start,
                       colorText: Colors.black),
                    ),
                  ),
                  Positioned(
                    left: 5.0,bottom: 15.0,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const SizedBox(height: 5.0),
                         Container(
                          padding: const EdgeInsets.all(2.5),
                           width:30.0 ,
                           decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(5.0)
                           ),
                           child: TextWidgetApp(
                            text: snapshot.data?[index].year.toString() ?? "",
                            size: 10.0,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            colorText: Colors.black),
                         ),
                       ],
                     ),
                   ),
                ],
              );
            }
          );
        }
      ),
    );
  }
}

