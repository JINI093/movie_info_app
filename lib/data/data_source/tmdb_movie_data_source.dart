import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'movie_data_source.dart';
import '../dto/dto.dart';

class TmdbMovieDataSource implements MovieDataSource {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String? apiKey = dotenv.env['TMDB_API_KEY'];

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/$id?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return MovieDetailDto.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
