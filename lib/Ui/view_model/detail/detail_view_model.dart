import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/core/util/result.dart';
import 'package:flutter_movie_info_app/domain/use_case/use_case.dart';
import 'detail_state.dart';

class DetailViewModel extends ChangeNotifier {
  final GetMovieDetailUseCase _getMovieDetailUseCase;

  DetailState _state = DetailState();
  DetailState get state => _state;

  DetailViewModel({
    required GetMovieDetailUseCase getMovieDetailUseCase,
  }) : _getMovieDetailUseCase = getMovieDetailUseCase;

  Future<void> fetchMovieDetail(int id) async {
    _state = _state.copyWith(isLoading: true, error: null);
    notifyListeners();

    final result = await _getMovieDetailUseCase.execute(id);

    switch (result) {
      case Success(data: final detail):
        _state = _state.copyWith(
          movieDetail: detail,
          isLoading: false,
        );
      case Error(failure: final failure):
        _state = _state.copyWith(
          error: failure.message,
          isLoading: false,
        );
    }

    notifyListeners();
  }
}
