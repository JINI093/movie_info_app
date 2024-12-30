import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model.dart';

class DetailScreen extends StatefulWidget {
  final int movieId;

  const DetailScreen({
    super.key,
    required this.movieId,
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                movieDetail.backdropUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieDetail.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movieDetail.tagline,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('상영시간: ${movieDetail.runtimeStr}'),
                  const SizedBox(height: 8),
                  Text(
                      '개봉일: ${movieDetail.releaseDate.toString().split(' ')[0]}'),
                  const SizedBox(height: 8),
                  Text('평점: ${movieDetail.voteAverage.toStringAsFixed(1)}'),
                  const SizedBox(height: 16),
                  const Text(
                    '줄거리',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(movieDetail.overview),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
