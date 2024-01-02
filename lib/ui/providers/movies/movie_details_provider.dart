import 'package:cinemapedia/ui/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final movieDetailsProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(movieDetailsCallback: movieRepository);
});

typedef MovieDetailsCallback = Future<Movie> Function({required String id});

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final MovieDetailsCallback movieDetailsCallback;

  MovieMapNotifier({required this.movieDetailsCallback}) : super({});

  Future<void> loadMovie(String id) async {
    if (state[id] != null) return;
    final movie = await movieDetailsCallback(id: id);

    state = {...state, id: movie};
  }
}
