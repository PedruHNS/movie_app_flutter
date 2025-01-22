import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData? icon;
  const ButtonCustom(
      {super.key, required this.onTap, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFcc82ff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        onPressed: onTap,
        iconAlignment: IconAlignment.start,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7100cd))),
            icon != null
                ? Icon(icon, color: Color(0xFF7100cd))
                : SizedBox.shrink(),
          ],
        ));
  }
}
