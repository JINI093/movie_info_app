import 'package:flutter/material.dart';
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

    try {
      final movieDetail = await _getMovieDetailUseCase.execute(id);
      _state = _state.copyWith(
        movieDetail: movieDetail,
        isLoading: false,
      );
    } catch (e) {
      _state = _state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
    notifyListeners();
  }
}
