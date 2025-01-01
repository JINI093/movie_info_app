import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/domain/model/movie.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final int movieId;
  final Movie movie;

  const DetailScreen({
    super.key,
    required this.movieId,
    required this.movie,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailViewModel>().fetchMovieDetail(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailViewModel>().state;
    final formatter = NumberFormat('#,###');

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

    final movieDetail = state.movieDetail;
    if (movieDetail == null) {
      return const Scaffold(
        body: Center(
          child: Text('영화 정보를 찾을 수 없습니다.'),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'poster_${widget.movie.id}',
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  movieDetail.backdropUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movieDetail.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('yyyy.MM.dd')
                            .format(movieDetail.releaseDate),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (movieDetail.tagline.isNotEmpty) ...[
                    Text(
                      movieDetail.tagline,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  Text(
                    '러닝타임: ${movieDetail.runtimeStr}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: movieDetail.genres
                        .map((genre) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(genre),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '줄거리',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movieDetail.overview,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildInfoCard('평점',
                            '${movieDetail.voteAverage.toStringAsFixed(1)}'),
                        _buildInfoCard(
                            '평점 투표수', formatter.format(movieDetail.voteCount)),
                        _buildInfoCard(
                            '인기도', movieDetail.popularity.toStringAsFixed(0)),
                        _buildInfoCard(
                            '예산', '\$${formatter.format(movieDetail.budget)}'),
                        _buildInfoCard(
                            '수익', '\$${formatter.format(movieDetail.revenue)}'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (movieDetail.productionCompanyLogos.isNotEmpty) ...[
                    const Text(
                      '제작사',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieDetail.productionCompanyLogos.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movieDetail.productionCompanyLogos[index]}',
                              height: 34,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
