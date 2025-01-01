class MovieDetail {
  final int budget;
  final List<String> genres;
  final int id;
  final List<String> productionCompanyLogos;
  final String overview;
  final double popularity;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;
  final String? posterPath;
  final String? backdropPath;

  MovieDetail({
    required this.budget,
    required this.genres,
    required this.id,
    required this.productionCompanyLogos,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    this.posterPath,
    this.backdropPath,
  });

  String get posterUrl =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w500$posterPath' : '';

  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/original$backdropPath'
      : '';

  String get runtimeStr {
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    if (hours > 0) {
      return '${hours}시간 ${minutes}분';
    }
    return '${minutes}분';
  }
}
