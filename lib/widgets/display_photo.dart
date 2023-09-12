import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  final String imageUrl;
  const DisplayPhoto({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: FadeInImage(
        image: NetworkImage(imageUrl),
        placeholder: const AssetImage('assets/images/placeholder.png'),
        placeholderFit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) => ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            'assets/images/no-image.png',
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
        ),
        fit: BoxFit.cover,
        height: 150,
        width: 150,
      ),
    );
  }
}
