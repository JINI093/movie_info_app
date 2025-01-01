import 'package:flutter_movie_info_app/core/util/result.dart';

import '../domain.dart';

class GetUpcomingMoviesUseCase {
  final MovieRepository _repository;

  GetUpcomingMoviesUseCase(this._repository);

  Future<Result<List<Movie>>> execute() async {
    return await _repository.fetchUpcomingMovies();
  }
}
