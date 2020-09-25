import 'package:flutter/material.dart';

class MealIconInfo extends StatelessWidget {
  final IconData icon;
  final String info;

  const MealIconInfo({this.icon, this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(info)
      ],
    );
  }
}
