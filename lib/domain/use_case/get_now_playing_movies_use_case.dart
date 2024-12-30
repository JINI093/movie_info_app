import '../domain.dart';

class GetNowPlayingMoviesUseCase {
  final MovieRepository _repository;

  GetNowPlayingMoviesUseCase(this._repository);

  Future<List<Movie>?> execute() async {
    return _repository.fetchNowPlayingMovies();
  }
}
