import 'dart:convert';
import 'package:flutter_movie_info_app/core/constants/api_constants.dart';
import 'package:flutter_movie_info_app/core/error/failures.dart';
import 'package:http/http.dart' as http;
import 'movie_data_source.dart';
import '../dto/dto.dart';
import '../../core/util/result.dart';
import 'package:flutter/foundation.dart';

class TmdbMovieDataSource implements MovieDataSource {
  final http.Client client;
  final String apiKey;

  TmdbMovieDataSource({
    required this.apiKey,
    required this.client,
  }) {
    debugPrint('API Key in DataSource: $apiKey');
  }

  @override
  Future<Result<MovieResponseDto>> fetchNowPlayingMovies() async {
    try {
      final url = Uri.parse(
          '${ApiConstants.baseUrl}/movie/now_playing?api_key=$apiKey&language=ko-KR');
      debugPrint('Request URL: ${url.toString()}');

      final response = await client.get(url);
      debugPrint('Response Status Code: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }
      return Error(
          ServerFailure('Failed to fetch movies: ${response.statusCode}'));
    } catch (e) {
      debugPrint('Error in fetchNowPlayingMovies: $e');
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<MovieResponseDto>> fetchPopularMovies() async {
    try {
      final response = await client.get(
        Uri.parse(
            '${ApiConstants.baseUrl}/movie/popular?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        ServerFailure('Failed to fetch movies: ${response.statusCode}'),
      );
    } catch (e) {
      return Error(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Result<MovieResponseDto>> fetchTopRatedMovies() async {
    try {
      final response = await client.get(
        Uri.parse(
            '${ApiConstants.baseUrl}/movie/top_rated?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        ServerFailure('Failed to fetch movies: ${response.statusCode}'),
      );
    } catch (e) {
      return Error(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Result<MovieResponseDto>> fetchUpcomingMovies() async {
    try {
      final response = await client.get(
        Uri.parse(
            '${ApiConstants.baseUrl}/movie/upcoming?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieResponseDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        ServerFailure('Failed to fetch movies: ${response.statusCode}'),
      );
    } catch (e) {
      return Error(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Result<MovieDetailDto>> fetchMovieDetail(int id) async {
    try {
      final response = await client.get(
        Uri.parse(
            '${ApiConstants.baseUrl}/movie/$id?api_key=$apiKey&language=ko-KR'),
      );

      if (response.statusCode == 200) {
        return Success(MovieDetailDto.fromJson(jsonDecode(response.body)));
      }

      return Error(
        ServerFailure('Failed to fetch movie detail: ${response.statusCode}'),
      );
    } catch (e) {
      return Error(
        ServerFailure(e.toString()),
      );
    }
  }
}
