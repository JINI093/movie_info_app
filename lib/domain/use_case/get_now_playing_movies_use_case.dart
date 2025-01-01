import 'package:flutter_movie_info_app/core/util/result.dart';

import '../domain.dart';

class GetNowPlayingMoviesUseCase {
  final MovieRepository _repository;

  GetNowPlayingMoviesUseCase(this._repository);

  Future<Result<List<Movie>>> execute() async {
    return await _repository.fetchNowPlayingMovies();
  }
}
