import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;

  const MovieCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/your_movie_poster.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
