import '../domain.dart';

class GetMovieDetailUseCase {
  final MovieRepository _repository;

  GetMovieDetailUseCase(this._repository);

  Future<MovieDetail?> execute(int id) async {
    return _repository.fetchMovieDetail(id);
  }
}
