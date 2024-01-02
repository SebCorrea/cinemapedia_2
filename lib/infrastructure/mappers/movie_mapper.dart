import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_from_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieFromMovieDb movieFromMovieDb) => Movie(
        adult: movieFromMovieDb.adult,
        backdropPath: movieFromMovieDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDb.backdropPath}'
            : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
        genreIds: movieFromMovieDb.genreIds.map((e) => e.toString()).toList(),
        id: movieFromMovieDb.id,
        originalLanguage: movieFromMovieDb.originalLanguage,
        originalTitle: movieFromMovieDb.originalTitle,
        overview: movieFromMovieDb.overview,
        popularity: movieFromMovieDb.popularity,
        posterPath: movieFromMovieDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDb.posterPath}'
            : 'no-poster',
        releaseDate: movieFromMovieDb.releaseDate,
        title: movieFromMovieDb.title,
        video: movieFromMovieDb.video,
        voteAverage: movieFromMovieDb.voteAverage,
        voteCount: movieFromMovieDb.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails movieDetails) => Movie(
        adult: movieDetails.adult,
        backdropPath: movieDetails.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
            : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
        genreIds: movieDetails.genres.map((e) => e.name).toList(),
        id: movieDetails.id,
        originalLanguage: movieDetails.originalLanguage,
        originalTitle: movieDetails.originalTitle,
        overview: movieDetails.overview,
        popularity: movieDetails.popularity,
        posterPath: movieDetails.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}'
            : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
        releaseDate: movieDetails.releaseDate,
        title: movieDetails.title,
        video: movieDetails.video,
        voteAverage: movieDetails.voteAverage,
        voteCount: movieDetails.voteCount,
      );
}
