import 'package:cinemapedia/ui/providers/movies/first_loading_provider.dart';
import 'package:cinemapedia/ui/providers/movies/movies_providers.dart';
import 'package:cinemapedia/ui/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    getAllMovies();
  }

  void getAllMovies() {
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(firstLoadingProvider)) return const FullScreenLoader();
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            titlePadding: EdgeInsets.zero,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideshow(movies: ref.watch(moviesSlideshowProvider)),
              MovieHorizontalListview(
                movies: ref.watch(nowPlayingMoviesProvider),
                title: 'En Cines',
                subtitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: ref.watch(upcomingMoviesProvider),
                title: 'Próximamente',
                subtitle: 'Este mes',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: ref.watch(popularMoviesProvider),
                title: 'Populares',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: ref.watch(topRatedMoviesProvider),
                title: 'Mejor Calificadas',
                loadNextPage: () =>
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
              ),
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}
