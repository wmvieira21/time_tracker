import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.hourglass_empty_rounded,
          size: 100,
          color: const Color.fromARGB(110, 158, 158, 158),
        ),
        Text('No time entries yet!',
            style: Theme.of(context).textTheme.bodyLarge),
        Text(
          'Tap the + button to add your first entry.',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
