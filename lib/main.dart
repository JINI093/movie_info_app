import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_movie_info_app/data/data.dart';
import 'package:flutter_movie_info_app/domain/use_case/use_case.dart';
import 'package:flutter_movie_info_app/ui/view_model/view_model.dart';
import 'ui/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const apiKey = String.fromEnvironment('TMDB_API_KEY', defaultValue: '');

  debugPrint('API Key: $apiKey');

  if (apiKey.isEmpty) {
    throw Exception(
        'API key not found. Make sure to run with --dart-define-from-file=.env');
  }

  final movieDataSource = TmdbMovieDataSource(apiKey: apiKey);
  final movieRepository = MovieRepositoryImpl(movieDataSource);
  final getNowPlayingMoviesUseCase =
      GetNowPlayingMoviesUseCase(movieRepository);
  final getPopularMoviesUseCase = GetPopularMoviesUseCase(movieRepository);
  final getTopRatedMoviesUseCase = GetTopRatedMoviesUseCase(movieRepository);
  final getUpcomingMoviesUseCase = GetUpcomingMoviesUseCase(movieRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            getNowPlayingMoviesUseCase: getNowPlayingMoviesUseCase,
            getPopularMoviesUseCase: getPopularMoviesUseCase,
            getTopRatedMoviesUseCase: getTopRatedMoviesUseCase,
            getUpcomingMoviesUseCase: getUpcomingMoviesUseCase,
          )..fetchInitialMovies(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailViewModel(
            getMovieDetailUseCase: GetMovieDetailUseCase(movieRepository),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Info App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}
