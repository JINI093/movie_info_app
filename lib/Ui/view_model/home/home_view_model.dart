import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/core/util/result.dart';
import 'package:flutter_movie_info_app/domain/use_case/use_case.dart';
import 'home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  HomeState _state = HomeState();
  HomeState get state => _state;

  HomeViewModel({
    required GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase,
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
    required GetTopRatedMoviesUseCase getTopRatedMoviesUseCase,
    required GetUpcomingMoviesUseCase getUpcomingMoviesUseCase,
  })  : _getNowPlayingMoviesUseCase = getNowPlayingMoviesUseCase,
        _getPopularMoviesUseCase = getPopularMoviesUseCase,
        _getTopRatedMoviesUseCase = getTopRatedMoviesUseCase,
        _getUpcomingMoviesUseCase = getUpcomingMoviesUseCase;

  Future<void> fetchInitialMovies() async {
    _state = _state.copyWith(isLoading: true, error: null);
    notifyListeners();

    final nowPlayingResult = await _getNowPlayingMoviesUseCase.execute();
    final popularResult = await _getPopularMoviesUseCase.execute();
    final topRatedResult = await _getTopRatedMoviesUseCase.execute();
    final upcomingResult = await _getUpcomingMoviesUseCase.execute();

    switch (nowPlayingResult) {
      case Success(data: final movies):
        _state = _state.copyWith(
          nowPlayingMovies: movies,
          isLoading: false,
        );
      case Error(failure: final failure):
        _state = _state.copyWith(
          error: failure.message,
          isLoading: false,
        );
    }

    if (popularResult is Success) {
      _state = _state.copyWith(popularMovies: popularResult.data);
    }
    if (topRatedResult is Success) {
      _state = _state.copyWith(topRatedMovies: topRatedResult.data);
    }
    if (upcomingResult is Success) {
      _state = _state.copyWith(upcomingMovies: upcomingResult.data);
    }

    notifyListeners();
  }
}
