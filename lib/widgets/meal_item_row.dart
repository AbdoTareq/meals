import 'package:flutter/material.dart';

class MealItemRow extends StatelessWidget {
  const MealItemRow({
    @required this.text,
    @required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: 4,
        ),
        Text('$text')
      ],
    );
  }
}
