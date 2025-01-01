import 'package:flutter_movie_info_app/core/util/result.dart';

import '../domain.dart';

class GetTopRatedMoviesUseCase {
  final MovieRepository _repository;

  GetTopRatedMoviesUseCase(this._repository);

  Future<Result<List<Movie>>> execute() async {
    return await _repository.fetchTopRatedMovies();
  }
}
