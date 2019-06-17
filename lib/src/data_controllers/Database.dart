import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trending_movies/src/models/movie.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TrendingNow.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Movie ("
              "id INTEGER PRIMARY KEY,"
              "vote_average TEXT,"
              "title TEXT,"
              "overview TEXT,"
              "poster_path TEXT,"
              "backdrop_path TEXT,"
              "release_date TEXT"
              ")");
        });
  }

  Future<void> insertMovie(Movie movie) async {
    final db = await database;
    await db.insert(
      'Movie',
      movie.toJSON(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAllMovies(List<Movie> movies) async {
    final db = await database;
    for (var movie in movies) {
      await db.insert(
        'Movie',
        movie.toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Movie>> getAllMovies() async {
    final db = await database;
    var res = await db.query("Movie");
    List<Movie> list = res.isNotEmpty ? res.map((c) => Movie.fromJSON(c)).toList() : [];
    return list;
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Movie");
  }

}