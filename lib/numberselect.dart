import 'package:flutter/material.dart';

class NumberSelection extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  NumberSelection({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.round().toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                onChanged(value - 1);
              },
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.white,
                size: 60,
              ),
            ),
            IconButton(
              onPressed: () {
                onChanged(value + 1);
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 60,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
