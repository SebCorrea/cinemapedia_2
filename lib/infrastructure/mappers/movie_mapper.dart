import 'package:cinemapedia/domain/entities/movie.dart';
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
            : 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
        releaseDate: movieFromMovieDb.releaseDate,
        title: movieFromMovieDb.title,
        video: movieFromMovieDb.video,
        voteAverage: movieFromMovieDb.voteAverage,
        voteCount: movieFromMovieDb.voteCount,
      );
}
