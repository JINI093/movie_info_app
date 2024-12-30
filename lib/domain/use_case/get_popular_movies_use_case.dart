import '../domain.dart';

class GetPopularMoviesUseCase {
  final MovieRepository _repository;

  GetPopularMoviesUseCase(this._repository);

  Future<List<Movie>?> execute() async {
    return _repository.fetchPopularMovies();
  }
}
