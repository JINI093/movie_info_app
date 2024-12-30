import 'package:flutter_movie_info_app/data/data_source/data_source.dart';
import 'package:flutter_movie_info_app/domain/domain.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _dataSource.fetchNowPlayingMovies();
    if (result == null) return null;

    return result.results
        .map((dto) => Movie(
              id: dto.id,
              title: dto.title,
              posterPath: dto.posterPath,
              backdropPath: dto.backdropPath,
              overview: dto.overview,
              voteAverage: dto.voteAverage,
              releaseDate: DateTime.parse(dto.releaseDate),
              popularity: dto.popularity,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final result = await _dataSource.fetchPopularMovies();
    if (result == null) return null;

    return result.results
        .map((dto) => Movie(
              id: dto.id,
              title: dto.title,
              posterPath: dto.posterPath,
              backdropPath: dto.backdropPath,
              overview: dto.overview,
              voteAverage: dto.voteAverage,
              releaseDate: DateTime.parse(dto.releaseDate),
              popularity: dto.popularity,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final result = await _dataSource.fetchTopRatedMovies();
    if (result == null) return null;

    return result.results
        .map((dto) => Movie(
              id: dto.id,
              title: dto.title,
              posterPath: dto.posterPath,
              backdropPath: dto.backdropPath,
              overview: dto.overview,
              voteAverage: dto.voteAverage,
              releaseDate: DateTime.parse(dto.releaseDate),
              popularity: dto.popularity,
            ))
        .toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final result = await _dataSource.fetchUpcomingMovies();
    if (result == null) return null;

    return result.results
        .map((dto) => Movie(
              id: dto.id,
              title: dto.title,
              posterPath: dto.posterPath,
              backdropPath: dto.backdropPath,
              overview: dto.overview,
              voteAverage: dto.voteAverage,
              releaseDate: DateTime.parse(dto.releaseDate),
              popularity: dto.popularity,
            ))
        .toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final result = await _dataSource.fetchMovieDetail(id);
    if (result == null) return null;

    return MovieDetail(
      budget: result.budget,
      genres: result.genres.map((genre) => genre.name).toList(),
      id: result.id,
      productionCompanyLogos: result.productionCompanies
          .map((company) => company.logoPath ?? '')
          .where((logo) => logo.isNotEmpty)
          .toList(),
      overview: result.overview,
      popularity: result.popularity,
      releaseDate: DateTime.parse(result.releaseDate),
      revenue: result.revenue,
      runtime: result.runtime,
      tagline: result.tagline,
      title: result.title,
      voteAverage: result.voteAverage,
      voteCount: result.voteCount,
      posterPath: result.posterPath,
      backdropPath: result.backdropPath,
    );
  }
}
