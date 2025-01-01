import '../../core/util/result.dart';
import '../dto/dto.dart';

abstract interface class MovieDataSource {
  Future<Result<MovieResponseDto>> fetchNowPlayingMovies();
  Future<Result<MovieResponseDto>> fetchPopularMovies();
  Future<Result<MovieResponseDto>> fetchTopRatedMovies();
  Future<Result<MovieResponseDto>> fetchUpcomingMovies();
  Future<Result<MovieDetailDto>> fetchMovieDetail(int id);
}
