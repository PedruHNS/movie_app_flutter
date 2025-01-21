import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData? icon;
  const ButtonCustom(
      {super.key, required this.onTap, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 77),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFcc82ff),
            borderRadius: BorderRadius.circular(32),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ]),
        child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: icon != null
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF7100cd),
                      fontWeight: FontWeight.bold),
                ),
                icon != null
                    ? Icon(icon, color: Color(0xFF7100cd))
                    : SizedBox.shrink()
              ],
            )),
      ),
    );
  }
}
