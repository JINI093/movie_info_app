import '../../core/util/result.dart';
import '../model/model.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> fetchNowPlayingMovies();

  Future<Result<List<Movie>>> fetchPopularMovies();

  Future<Result<List<Movie>>> fetchTopRatedMovies();

  Future<Result<List<Movie>>> fetchUpcomingMovies();

  Future<Result<MovieDetail>> fetchMovieDetail(int id);
}
