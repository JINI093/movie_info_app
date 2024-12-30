import 'package:flutter/material.dart';
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
            children: movies.map((title) => MovieCard(title: title)).toList(),
          ),
        ),
      ],
    );
  }
}
