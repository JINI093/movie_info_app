import 'package:flutter/material.dart';
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

    try {
      final nowPlayingMovies = await _getNowPlayingMoviesUseCase.execute();
      final popularMovies = await _getPopularMoviesUseCase.execute();
      final topRatedMovies = await _getTopRatedMoviesUseCase.execute();
      final upcomingMovies = await _getUpcomingMoviesUseCase.execute();

      _state = _state.copyWith(
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        topRatedMovies: topRatedMovies,
        upcomingMovies: upcomingMovies,
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
