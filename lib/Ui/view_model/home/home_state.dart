import 'package:flutter_movie_info_app/domain/model/model.dart';

class HomeState {
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? popularMovies;
  final List<Movie>? topRatedMovies;
  final List<Movie>? upcomingMovies;
  final bool isLoading;
  final String? error;

  HomeState({
    this.nowPlayingMovies,
    this.popularMovies,
    this.topRatedMovies,
    this.upcomingMovies,
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
