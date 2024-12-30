import 'package:flutter_movie_info_app/data/dto/dto.dart';

abstract interface class MovieDataSource {
  Future<MovieResponseDto?> fetchNowPlayingMovies();
  Future<MovieResponseDto?> fetchPopularMovies();
  Future<MovieResponseDto?> fetchTopRatedMovies();
  Future<MovieResponseDto?> fetchUpcomingMovies();
  Future<MovieDetailDto?> fetchMovieDetail(int id);
}
