import 'package:cinemapedia/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/views/views.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late PageController pageController;
  final List<Widget> views = const [HomeView(), PopularView(), FavoritesView()];

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 250),
      );
    }
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: views,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageIndex: widget.pageIndex,
        numberOfViews: views.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
