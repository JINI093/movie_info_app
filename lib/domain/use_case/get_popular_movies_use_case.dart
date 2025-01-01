import 'package:flutter_movie_info_app/core/util/result.dart';

import '../domain.dart';

class GetPopularMoviesUseCase {
  final MovieRepository _repository;

  GetPopularMoviesUseCase(this._repository);

  Future<Result<List<Movie>>> execute() async {
    return await _repository.fetchPopularMovies();
  }
}
