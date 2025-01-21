import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData? icon;
  const ButtonCustom(
      {super.key, required this.onTap, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: onTap,
    //   child: Ink(
    //       decoration: BoxDecoration(
    //           color: Color(0xFFcc82ff),
    //           borderRadius: BorderRadius.circular(32),
    //           boxShadow: const [
    //             BoxShadow(
    //               color: Colors.black,
    //               blurRadius: 5.0,
    //             ),
    //           ]),
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    //         child: Row(
    //           mainAxisAlignment: icon != null
    //               ? MainAxisAlignment.spaceEvenly
    //               : MainAxisAlignment.center,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text(
    //               text,
    //               style: TextStyle(
    //                   fontSize: 24,
    //                   color: Color(0xFF7100cd),
    //                   fontWeight: FontWeight.bold),
    //             ),
    //             icon != null
    //                 ? Icon(icon, color: Color(0xFF7100cd))
    //                 : SizedBox.shrink()
    //           ],
    //         ),
    //       )),
    // );
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFcc82ff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          shadowColor: Colors.black,
          elevation: 5.0,
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
