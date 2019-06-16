import '../data_controllers/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie.dart';


class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<GetMovieResponse>();

  Observable<GetMovieResponse> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    GetMovieResponse movieResponse = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(movieResponse);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();