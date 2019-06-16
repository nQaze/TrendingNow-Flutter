import 'package:flutter/material.dart';
import 'screens/movie_list.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.grey[900]),
      home: Scaffold(
        body: MovieList(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}