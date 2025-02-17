import 'package:flutter/material.dart';

class RoundedButtom extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function() onPress;
  const RoundedButtom(
      {super.key,
      required this.color,
      required this.icon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
      ),
      child: SizedBox(
        height: 50,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
