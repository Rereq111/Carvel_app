import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.build_circle_outlined,
              color: colors.primary,
            ),
            const SizedBox(
              width: 5,
              height: 40,
            ),
            Text(
              'Carvel_App',
              style: titleStyle,
            ),
          ],
        ),
      ),
    ));
  }
}
