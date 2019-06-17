import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../blocs/movies_bloc.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              child: buildList(snapshot),
              onRefresh: bloc.fetchMovies,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator(
            backgroundColor: Colors.black26,
          ));
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Movie>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 12.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: InkResponse(
              enableFeedback: true,
              child: Container(
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.black,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                            image: new NetworkImage(
                              'https://image.tmdb.org/t/p/w500${snapshot.data[index].backdrop_path}',
                            ),
                          ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(snapshot.data[index].title,
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(snapshot.data[index].vote_average.toString(),
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        }
    );
  }

  openDetailPage(List<Movie> movies, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetails(
          movie: movies[index],
        );
      }),
    );
  }

}