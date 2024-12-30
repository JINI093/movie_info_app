import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_movie_info_app/data/data.dart';
import 'package:flutter_movie_info_app/domain/use_case/use_case.dart';
import 'package:flutter_movie_info_app/ui/view_model/view_model.dart';
import 'ui/screens/home_screen.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint('Error loading .env file: $e');
  }

  final movieDataSource = TmdbMovieDataSource();
  final movieRepository = MovieRepositoryImpl(movieDataSource);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            getNowPlayingMoviesUseCase:
                GetNowPlayingMoviesUseCase(movieRepository),
            getPopularMoviesUseCase: GetPopularMoviesUseCase(movieRepository),
            getTopRatedMoviesUseCase: GetTopRatedMoviesUseCase(movieRepository),
            getUpcomingMoviesUseCase: GetUpcomingMoviesUseCase(movieRepository),
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
