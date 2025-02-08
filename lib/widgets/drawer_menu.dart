import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.selectedItemDrawer});

  final Function(int indexTab) selectedItemDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.onSecondaryContainer,
                Theme.of(context).colorScheme.onPrimaryContainer
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              // alignment: Alignment.center,
              child: Text('Menu',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Projects'),
            onTap: () => selectedItemDrawer(0),
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Tasks'),
            onTap: () => selectedItemDrawer(1),
          ),
        ],
      ),
    );
  }
}
