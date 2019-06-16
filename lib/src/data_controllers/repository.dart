import 'dart:async';
import 'movies_api_provider.dart';
import '../models/movie.dart';

class Repository{
  final moviesApiProvider = MovieApiProvider();
  Future<GetMovieResponse> fetchAllMovies() => moviesApiProvider.getMovies();
}