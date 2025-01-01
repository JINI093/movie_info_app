import 'package:flutter_movie_info_app/core/util/result.dart';

import '../domain.dart';

class GetMovieDetailUseCase {
  final MovieRepository _repository;

  GetMovieDetailUseCase(this._repository);

  Future<Result<MovieDetail>> execute(int id) async {
    return await _repository.fetchMovieDetail(id);
  }
}
