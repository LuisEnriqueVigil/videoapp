
import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/data/apis/get_movie_trending.dart';
import 'package:mas_uno_test/src/domain/models/moviesTrending/response_get_trending_model.dart';
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
      height: 150.0,
      child: FutureBuilder<List<ResponseGetTrendingMovies>>(
        future: getMovieTrendingService.getMovieTrending(),
        builder: (context, snapshot) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (snapshot.data?? []).length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: Colors.red),
                    ),
                     Positioned(
                      bottom: 10.0,right: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:const [
                          TextWidgetApp(
                              text: "Nombre",
                              size: 12.0,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              colorText: Colors.white),
                          SizedBox(height: 5.0),
                          TextWidgetApp(
                              text: "Watcher",
                              size: 10.0,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              colorText: Colors.white),
                        ],
                      ),
                    )
                  ],
                );
              });
        }
      ),
    );
  }
}
