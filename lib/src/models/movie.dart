
class GetMovieResponse {

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  GetMovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    List<Movie> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Movie movie = Movie.fromJSON(parsedJson['results'][i]);
      temp.add(movie);
    }
    _movies = temp;
  }

}

class Movie{
  int id;
  String title;
  String overview;
  String vote_average;
  String poster_path;
  String backdrop_path;
  String release_date;

  Movie({this.id, this.title, this.overview, this.vote_average, this.poster_path, this.backdrop_path, this.release_date});

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'vote_average': vote_average,
      'poster_path': poster_path,
      'backdrop_path': backdrop_path,
      'release_date': release_date,
    };
  }

  factory Movie.fromJSON(Map<String, dynamic> json) => new Movie(
    id: json["id"],
    title: json["title"],
    overview: json["overview"],
    vote_average: json["vote_average"].toString(),
    poster_path: json["poster_path"],
    backdrop_path: json["backdrop_path"],
    release_date: json["release_date"],
  );

}