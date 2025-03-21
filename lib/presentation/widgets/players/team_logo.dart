import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class TeamLogo extends StatelessWidget {
  final String? teamName;
  final double height;

  const TeamLogo({
    super.key,
    required this.teamName,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    String logoUrl = '';

    if (teamName == 'Denver Nuggets') {
      logoUrl =
          'https://logosmarcas.net/wp-content/uploads/2020/07/Denver-Nuggets-Emblema.jpg';
    }

    return FadeIn(
      child: Image.network(
        logoUrl,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress != null) {
            return SizedBox(
              height: height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return child;
        },
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            height: height,
            child: const Center(child: Icon(Icons.broken_image)),
          );
        },
      ),
    );
  }
}
