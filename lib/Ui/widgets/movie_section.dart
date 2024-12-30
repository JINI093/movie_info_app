import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/domain/model/movie.dart';
import 'movie_card.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<String> movies;

  const MovieSection({
    super.key,
    required this.title,
    required this.movies,
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movies
                .map((movie) => MovieCard(
                      movie: Movie(
                        title: movie,
                        id: 0,
                        overview: '',
                        voteAverage: 0,
                        releaseDate: DateTime.now(),
                        popularity: 0,
                      ),
                      onTap: () {},
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
