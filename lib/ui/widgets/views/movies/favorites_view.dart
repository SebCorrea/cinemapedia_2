import 'package:cinemapedia/ui/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    isLastPage = movies.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle = Theme.of(context).textTheme;
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border_sharp,
                color: colorScheme.primary,
                size: 50.0,
              ),
              Text(
                'Ups! Parece que aún no tienes películas favoritas',
                style: textStyle.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Añade tus películas favoritas y velas sin conexión a internet',
                style: textStyle.titleSmall!.copyWith(fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: MovieMasonry(
        movies: favoriteMovies,
        loadNextPage: _loadNextPage,
      ),
    );
  }
}
