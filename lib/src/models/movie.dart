class GetMovieResponse {
  int _page;
  int _total_results;
  int _total_pages;
  List<Movie> _movies = [];


  int get page => _page;

  int get total_results => _total_results;

  int get total_pages => _total_pages;

  List<Movie> get results => _movies;

  GetMovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];

    List<Movie> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Movie movie = Movie(parsedJson['results'][i]);
      temp.add(movie);
    }

    _movies = temp;
  }

}

class Movie{
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;


  Movie(movie){
    _vote_count = movie['vote_count'];
    _id = movie['id'];
    _video = movie['video'];
    _vote_average = movie['vote_average'];
    _title = movie['title'];
    _popularity = movie['popularity'];
    _poster_path = movie['poster_path'];
    _original_language = movie['original_language'];
    _original_title = movie['original_title'];
    for (int i = 0; i < movie['genre_ids'].length; i++) {
      _genre_ids.add(movie['genre_ids'][i]);
    }
    _backdrop_path = movie['backdrop_path'];
    _adult = movie['adult'];
    _overview = movie['overview'];
    _release_date = movie['release_date'];
  }

  int get vote_count => _vote_count;

  int get id => _id;

  bool get video => _video;

  get vote_average => _vote_average;

  String get title => _title;

  double get popularity => _popularity;

  String get poster_path => _poster_path;

  String get original_language => _original_language;

  String get original_title => _original_title;

  List<int> get genre_ids => _genre_ids;

  String get backdrop_path => _backdrop_path;

  bool get adult => _adult;

  String get overview => _overview;

  String get release_date => _release_date;


}