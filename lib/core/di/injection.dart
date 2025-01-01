import 'package:flutter_movie_info_app/Ui/view_model/detail/detail_view_model.dart';
import 'package:flutter_movie_info_app/Ui/view_model/home/home_view_model.dart';
import 'package:flutter_movie_info_app/core/network/network_info.dart';
import 'package:flutter_movie_info_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_info_app/data/data_source/tmdb_movie_data_source.dart';
import 'package:flutter_movie_info_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_info_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_info_app/domain/use_case/get_movie_detail_use_case.dart';
import 'package:flutter_movie_info_app/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:flutter_movie_info_app/domain/use_case/get_popular_movies_use_case.dart';
import 'package:flutter_movie_info_app/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:flutter_movie_info_app/domain/use_case/get_upcoming_movies_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker()),
  ); // 네트워크 상태 체크

  // Data Sources
  getIt.registerLazySingleton<MovieDataSource>(
    () => TmdbMovieDataSource(
      apiKey: const String.fromEnvironment('TMDB_API_KEY'),
      client: http.Client(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      dataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUpcomingMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMovieDetailUseCase(getIt()));

  // ViewModels
  getIt.registerFactory(() => HomeViewModel(
        getNowPlayingMoviesUseCase: getIt(),
        getPopularMoviesUseCase: getIt(),
        getTopRatedMoviesUseCase: getIt(),
        getUpcomingMoviesUseCase: getIt(),
      ));

  getIt.registerFactory(() => DetailViewModel(
        getMovieDetailUseCase: getIt(),
      ));
}
