import 'package:flutter_movie_info_app/core/error/failures.dart';
import 'package:flutter_movie_info_app/core/network/network_info.dart';
import 'package:flutter_movie_info_app/data/data_source/data_source.dart';
import 'package:flutter_movie_info_app/domain/domain.dart';
import '../../core/util/result.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Result<List<Movie>>> fetchNowPlayingMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.fetchNowPlayingMovies();
        if (result is Success) {
          return Success(
            result.results
                .map((movieDto) => Movie(
                      id: movieDto.id,
                      title: movieDto.title,
                      posterPath: movieDto.posterPath,
                      backdropPath: movieDto.backdropPath,
                      overview: movieDto.overview,
                      voteAverage: movieDto.voteAverage,
                      releaseDate: DateTime.parse(movieDto.releaseDate),
                      popularity: movieDto.popularity,
                    ))
                .toList(),
          );
        }
        return Error(ServerFailure('Failed to fetch movies'));
      } catch (e) {
        return Error(ServerFailure(e.toString()));
      }
    } else {
      return Error(NetworkFailure('인터넷 연결을 확인해주세요.'));
    }
  }

  @override
  Future<Result<List<Movie>>> fetchPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.fetchPopularMovies();
        if (result is Success) {
          return Success(result.data.results
              .map((movieDto) => Movie(
                    id: movieDto.id,
                    title: movieDto.title,
                    posterPath: movieDto.posterPath,
                    backdropPath: movieDto.backdropPath,
                    overview: movieDto.overview,
                    voteAverage: movieDto.voteAverage,
                    releaseDate: DateTime.parse(movieDto.releaseDate),
                    popularity: movieDto.popularity,
                  ))
              .toList());
        }
        return Error(ServerFailure('Failed to fetch movies'));
      } catch (e) {
        return Error(ServerFailure(e.toString()));
      }
    } else {
      return Error(NetworkFailure('인터넷 연결을 확인해주세요.'));
    }
  }

  @override
  Future<Result<List<Movie>>> fetchTopRatedMovies() async {
    final result = await dataSource.fetchTopRatedMovies();
    if (result is Success) {
      return Success(result.data.results
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
          .toList());
    }
    return Error(ServerFailure('Failed to fetch movies'));
  }

  @override
  Future<Result<List<Movie>>> fetchUpcomingMovies() async {
    final result = await dataSource.fetchUpcomingMovies();
    if (result is Success) {
      return Success(result.data.results
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
          .toList());
    }
    return Error(ServerFailure('Failed to fetch movies'));
  }

  @override
  Future<Result<MovieDetail>> fetchMovieDetail(int id) async {
    final result = await dataSource.fetchMovieDetail(id);
    if (result is Success) {
      final dto = result.data;
      return Success(MovieDetail(
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
      ));
    }
    return Error(ServerFailure('Failed to fetch movie detail'));
  }
}
