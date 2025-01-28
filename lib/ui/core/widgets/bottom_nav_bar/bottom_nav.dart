import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int itemSelected;
  final void Function(int) onItemTap;
  final List<MenuItem> items;
  const BottomNav(
      {super.key,
      required this.itemSelected,
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
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 7,
                  spreadRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                items.length,
                (index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => onItemTap(index),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: itemSelected == index
                              ? Colors.grey[200]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          item.icon,
                          size: itemSelected == index ? 32 : 25,
                          color: itemSelected == index
                              ? Colors.black
                              : Color(0xFF7100cd),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String? title;
  final IconData icon;
  const MenuItem({this.title, required this.icon});
}
