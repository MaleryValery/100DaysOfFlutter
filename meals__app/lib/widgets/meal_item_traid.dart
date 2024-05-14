import 'package:flutter/material.dart';

class MealItemTraid extends StatelessWidget {
  const MealItemTraid({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
