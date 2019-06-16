import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/movie.dart';

class MovieApiProvider{

  Client client = Client();
  final _apiKey = 'e34db975d3d774265360577acefef347';

  Future<GetMovieResponse> getMovies() async{
    print("entered");
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return GetMovieResponse.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}