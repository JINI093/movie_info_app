import '../domain.dart';

class GetTopRatedMoviesUseCase {
  final MovieRepository _repository;

  GetTopRatedMoviesUseCase(this._repository);

  Future<List<Movie>?> execute() async {
    return _repository.fetchTopRatedMovies();
  }
}
