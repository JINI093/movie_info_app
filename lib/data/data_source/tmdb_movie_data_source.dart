import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_data_source.dart';
import '../dto/dto.dart';
import 'package:flutter/foundation.dart';

class TmdbMovieDataSource implements MovieDataSource {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey;

  TmdbMovieDataSource({required this.apiKey});

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey&language=ko-KR'),
      );

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(jsonDecode(response.body));
      }
      throw Exception('Failed to load movies: ${response.statusCode}');
    } catch (e) {
      debugPrint('Error fetching movies: $e');
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
