import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final firstLoadingProvider = Provider<bool>((ref) {
  final List<bool> steps = [
    ref.watch(nowPlayingMoviesProvider).isEmpty,
    ref.watch(popularMoviesProvider).isEmpty,
    ref.watch(topRatedMoviesProvider).isEmpty,
    ref.watch(upcomingMoviesProvider).isEmpty
  ];
  return steps.contains(true);
});
