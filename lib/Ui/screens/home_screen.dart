import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model.dart';
import '../widgets/movie_list_section.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeViewModel>().state;

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.error != null) {
      return Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.nowPlayingMovies?.isNotEmpty ?? false) ...[
              Stack(
                children: [
                  Container(
                    height: 550,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          state.nowPlayingMovies!.first.backdropUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 550,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    child: Text(
                      state.nowPlayingMovies!.first.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            if (state.popularMovies != null) ...[
              MovieListSection(
                title: '가장 인기있는',
                movies: state.popularMovies!,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(movieId: movie.id),
                    ),
                  );
                },
              ),
            ],
            if (state.nowPlayingMovies != null) ...[
              MovieListSection(
                title: '현재 상영중',
                movies: state.nowPlayingMovies!,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(movieId: movie.id),
                    ),
                  );
                },
              ),
            ],
            if (state.topRatedMovies != null) ...[
              MovieListSection(
                title: '평점이 높은 영화',
                movies: state.topRatedMovies!,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(movieId: movie.id),
                    ),
                  );
                },
              ),
            ],
            if (state.upcomingMovies != null) ...[
              MovieListSection(
                title: '개봉 예정',
                movies: state.upcomingMovies!,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(movieId: movie.id),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
