
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetails extends StatefulWidget {

  final Movie movie;

  MovieDetails({
    this.movie,
  });

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState(
      movie: movie,
    );
  }


}

class MovieDetailState extends State<MovieDetails> {

  final Movie movie;

  MovieDetailState({
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              color: Colors.black,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
            child: Text(movie.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movie.overview),
          )
        ],
      ),
    );
  }

}