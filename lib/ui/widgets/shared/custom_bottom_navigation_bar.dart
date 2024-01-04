import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int pageIndex;
  const CustomBottomNavigationBar({super.key, required this.pageIndex});

  final Map<int, String> routes = const {0: '/'};
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_max),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.label_outline),
        label: 'Categorías',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined),
        label: 'Favoritos',
      )
    ]);
  }
}
