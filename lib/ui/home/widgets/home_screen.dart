import 'package:flutter/material.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreen extends StatelessWidget {
  final HomeVm controller = HomeVm();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Watch((context) {
        return controller.page[controller.selectedScreenIndex.value];
      }),
      bottomNavigationBar: Watch((context) {
        return BottomNavigationBar(
          currentIndex: controller.selectedScreenIndex.value,
          onTap: controller.onTapScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Popular',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
              ),
              label: 'Estreia',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.ac_unit,
              ),
              label: 'Top filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favoritos',
            ),
          ],
        );
      }),
    );
  }
}
