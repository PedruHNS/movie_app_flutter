import 'package:flutter/material.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreen extends StatelessWidget {
  final HomeVm controller;
  const HomeScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Watch((context) {
            return controller.page[controller.selectedScreenIndex.value];
          }),
          BottomNav(
              itemCount: controller.page.length,
              items: [
                Icon(Icons.favorite),
                Icon(Icons.favorite),
              ],
              onItemTap: controller.onTapScreen),
        ],
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final int itemCount;
  final void Function(int) onItemTap;
  final List<Widget> items;
  const BottomNav(
      {super.key,
      required this.itemCount,
      required this.onItemTap,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
