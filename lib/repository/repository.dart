import 'package:dio/dio.dart';
import 'package:movieapp/model/genre_response.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:movieapp/model/person_response.dart';

class MovieRepository {
  final String apiKey = "87e5ad5f1e381cd23d8e1ed76c03bf66";
  static String mainUrl = "https://api.themoviedb.org/3";

  static Dio _dio = Dio();

  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/trending/person/week';

  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Exception occured: $err, stackStrace: $stacktrace");
      return MovieResponse.withError("$err");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };

    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Exception occured: $err, stackStrace: $stacktrace");
      return MovieResponse.withError("$err");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Exception occured: $err, stackStrace: $stacktrace");
      return GenreResponse.withError("$err");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      "api_key": apiKey,
    };

    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Exception occured: $err, stackStrace: $stacktrace");
      return PersonResponse.withError("$err");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id,
    };

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Exception occured: $err, stackStrace: $stacktrace");
      return MovieResponse.withError("$err");
    }
  }
}
