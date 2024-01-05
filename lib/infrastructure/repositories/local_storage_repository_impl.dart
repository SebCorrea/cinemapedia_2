import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource localDatasource;

  LocalStorageRepositoryImpl({required this.localDatasource});

  @override
  Future<bool> isMovieFavorite(int id) {
    return localDatasource.isMovieFavorite(id);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return localDatasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return localDatasource.toggleFavorite(movie);
  }
}
