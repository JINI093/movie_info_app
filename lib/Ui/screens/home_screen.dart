import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model.dart';
import '../widgets/movie_list_section.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get movieDetail => null;

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
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 50.0),
              child: Text(
                '가장 인기있는',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                title: '현재 상영중',
                movies: state.popularMovies!,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movieId: movie.id,
                        movieDetail: movieDetail,
                        movie: movie,
                      ),
                    ),
                  );
                },
              ),
            ],
            if (state.nowPlayingMovies != null) ...[
              MovieListSection(
                title: '인기순',
                movies: state.nowPlayingMovies!,
                showRanking: true,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movieId: movie.id,
                        movieDetail: movieDetail,
                        movie: movie,
                      ),
                    ),
                  );
                },
              ),
            ],
            if (state.topRatedMovies != null) ...[
              MovieListSection(
                title: '평점 높은순',
                movies: state.topRatedMovies!,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movieId: movie.id,
                        movieDetail: movieDetail,
                        movie: movie,
                      ),
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
                      builder: (context) => DetailScreen(
                        movieId: movie.id,
                        movieDetail: movieDetail,
                        movie: movie,
                      ),
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
