import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String title;
  final Color color;
  final double textSize;
  final VoidCallback onPressed;

  const CustomBottom({
    super.key,
    required this.title,
    required this.color,
    required this.textSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: const Size(100, 90),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: textSize, color: Colors.white),
      ),
    );
  }
}
