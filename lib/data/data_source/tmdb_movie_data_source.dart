import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_data_source.dart';
import '../dto/dto.dart';
import 'package:flutter/foundation.dart';
import '../../core/util/result.dart';

class TmdbMovieDataSource implements MovieDataSource {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey;

  TmdbMovieDataSource({required this.apiKey});

  @override
  Future<Result<MovieResponseDto>> fetchNowPlayingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        message: 'Failed to fetch movies: ${response.statusCode}',
        error: response.body,
      );
    } catch (e) {
      return Error(
        message: 'Network error occurred',
        error: e,
      );
    }
  }

  @override
  Future<Result<MovieResponseDto>> fetchPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        message: 'Failed to fetch movies: ${response.statusCode}',
        error: response.body,
      );
    } catch (e) {
      return Error(
        message: 'Network error occurred',
        error: e,
      );
    }
  }

  @override
  Future<Result<MovieResponseDto>> fetchTopRatedMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        message: 'Failed to fetch movies: ${response.statusCode}',
        error: response.body,
      );
    } catch (e) {
      return Error(
        message: 'Network error occurred',
        error: e,
      );
    }
  }

  @override
  Future<Result<MovieResponseDto>> fetchUpcomingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        message: 'Failed to fetch movies: ${response.statusCode}',
        error: response.body,
      );
    } catch (e) {
      return Error(
        message: 'Network error occurred',
        error: e,
      );
    }
  }

  @override
  Future<Result<MovieDetailDto>> fetchMovieDetail(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movie/$id?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieDetailDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        message: 'Failed to fetch movie detail: ${response.statusCode}',
        error: response.body,
      );
    } catch (e) {
      return Error(
        message: 'Network error occurred',
        error: e,
      );
    }
  }
}
