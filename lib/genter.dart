import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final bool isSelected;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  GenderSelection(
      {required this.isSelected,
      required this.label,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 180,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Color.fromRGBO(92, 92, 116, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 35,
            ),
            Icon(icon, size: 70),
            Text(
              label,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
