import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'actors_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsNotifier, Map<String, List<Actor>>>((ref) {
  final fetchMoreActors = ref.watch(actorRepositoryProvider).getActorsByMovieId;
  return ActorsNotifier(getActorsCallback: fetchMoreActors);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String id);

class ActorsNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActorsCallback;

  ActorsNotifier({required this.getActorsCallback}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActorsCallback(movieId);
    state = {...state, movieId: actors};
  }
}
