import 'package:flutter_movie_info_app/data/data_source/data_source.dart';
import 'package:flutter_movie_info_app/domain/domain.dart';
import '../../core/util/result.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _dataSource.fetchNowPlayingMovies();
    if (result is Success) {
      return result.data.results
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
    return null;
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final result = await _dataSource.fetchPopularMovies();
    if (result is Success) {
      return result.data.results
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
    return null;
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final result = await _dataSource.fetchTopRatedMovies();
    if (result is Success) {
      return result.data.results
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
    return null;
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final result = await _dataSource.fetchUpcomingMovies();
    if (result is Success) {
      return result.data.results
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
    return null;
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final result = await _dataSource.fetchMovieDetail(id);
    if (result is Success) {
      final dto = result.data;
      return MovieDetail(
        budget: dto.budget,
        genres: dto.genres.map((genre) => genre.name).toList(),
        id: dto.id,
        productionCompanyLogos: dto.productionCompanies
            .map((company) => company.logoPath ?? '')
            .where((logo) => logo.isNotEmpty)
            .toList(),
        overview: dto.overview,
        popularity: dto.popularity,
        releaseDate: DateTime.parse(dto.releaseDate),
        revenue: dto.revenue,
        runtime: dto.runtime,
        tagline: dto.tagline,
        title: dto.title,
        voteAverage: dto.voteAverage,
        voteCount: dto.voteCount,
        posterPath: dto.posterPath,
        backdropPath: dto.backdropPath,
      );
    }
    return null;
  }
}
