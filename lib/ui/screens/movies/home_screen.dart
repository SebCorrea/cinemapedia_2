import 'package:cinemapedia/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/views/views.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  final views = const <Widget>[HomeView(), Placeholder(), FavoritesView()];
  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: views,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageIndex: pageIndex,
      ),
    );
  }
}
