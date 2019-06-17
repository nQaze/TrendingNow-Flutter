import '../data_controllers/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie.dart';
import '../data_controllers/Database.dart';


class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<List<Movie>>();

  Observable<List<Movie>> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    List<Movie> movies = await DBProvider.db.getAllMovies();
    if (movies.isEmpty){
      GetMovieResponse movieResponse = await _repository.fetchAllMovies();
      DBProvider.db.insertAllMovies(movieResponse.movies);
    }
    _moviesFetcher.sink.add(movies);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();