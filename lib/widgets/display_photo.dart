import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  const DisplayPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        'assets/images/slack-display-photo.jpg',
        fit: BoxFit.cover,
        height: 160,
        width: 160,
      ),
    );
  }
}
