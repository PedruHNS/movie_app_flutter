import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:movie_db/ui/core/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreen extends StatelessWidget {
  final HomeVm controller;
  const HomeScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color(0xFF7100cd),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Watch((context) {
            //   return controller.page[controller.selectedScreenIndex.value];
            // }),
            CustomScrollView(slivers: [
              
            ]),

            Watch((context) {
              return BottomNav(
                  itemSelected: controller.selectedScreenIndex.value,
                  items: [
                    MenuItem(icon: MdiIcons.movie),
                    MenuItem(icon: MdiIcons.movieRoll),
                    MenuItem(icon: MdiIcons.videoVintage),
                    MenuItem(icon: MdiIcons.heart),
                  ],
                  onItemTap: controller.onTapScreen);
            }),
          ],
        ),
      ),
    );
  }
}
