import 'package:cinemapedia/ui/providers/movies/movies_providers.dart';
import 'package:cinemapedia/ui/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    await ref.read(popularMoviesProvider.notifier).loadNextPage();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieMasonry(
        movies: ref.watch(popularMoviesProvider),
        loadNextPage: _loadNextPage,
      ),
    );
  }
}
