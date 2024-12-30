import 'package:flutter_movie_info_app/domain/model/model.dart';

class DetailState {
  final MovieDetail? movieDetail;
  final bool isLoading;
  final String? error;

  DetailState({
    this.movieDetail,
    this.isLoading = false,
    this.error,
  });

  DetailState copyWith({
    MovieDetail? movieDetail,
    bool? isLoading,
    String? error,
  }) {
    return DetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
