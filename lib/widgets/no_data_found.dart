import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, required this.typeOfData, required this.icon});
  final String typeOfData;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
            color: const Color.fromARGB(110, 158, 158, 158),
          ),
          Text('No $typeOfData yet!',
              style: Theme.of(context).textTheme.bodyLarge),
          Text(
            'Tap the + button to add your $typeOfData.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
