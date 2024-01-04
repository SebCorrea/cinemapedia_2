import 'package:cinemapedia/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/views/views.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  final List<Widget> views = const [HomeView(), Placeholder(), FavoritesView()];

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
        numberOfViews: views.length,
      ),
    );
  }
}
