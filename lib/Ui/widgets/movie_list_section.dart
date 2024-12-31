import 'package:flutter/material.dart';
import '../../domain/model/model.dart';
import 'movie_card.dart';

class MovieListSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final Function(Movie) onMovieTap;
  final bool showRanking;

  const MovieListSection({
    super.key,
    required this.title,
    required this.movies,
    required this.onMovieTap,
    this.showRanking = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(
                movie: movie,
                onTap: () => onMovieTap(movie),
                ranking: showRanking ? index + 1 : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
