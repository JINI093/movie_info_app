import 'package:flutter/material.dart';
import '../../domain/model/model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final int? ranking;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
    this.ranking,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Hero(
            tag: 'poster_${movie.id}',
            child: Container(
              width: 130,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(movie.posterUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (ranking != null) ...[
            Positioned(
              left: -10,
              bottom: -15,
              child: Text(
                '$ranking',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
