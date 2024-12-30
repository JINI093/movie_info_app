import '../domain.dart';

class GetUpcomingMoviesUseCase {
  final MovieRepository _repository;

  GetUpcomingMoviesUseCase(this._repository);

  Future<List<Movie>?> execute() async {
    return _repository.fetchUpcomingMovies();
  }
}
