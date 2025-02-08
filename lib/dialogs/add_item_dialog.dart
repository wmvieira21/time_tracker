import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({super.key, required this.tittle});

  final String tittle;

  _saveData(BuildContext context, String tittle) {
    if (tittle.trim().isNotEmpty) {
      Navigator.of(context).pop(tittle);
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tittle must be valid!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tittleController = TextEditingController();

    return AlertDialog(
      title: Text(
        "Add $tittle",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      content: TextField(
        autofocus: true,
        controller: tittleController,
        maxLength: 30,
        decoration: InputDecoration(
          label: Text('$tittle Name'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => _saveData(context, tittleController.text),
          child: Text('Save'),
        )
      ],
    );
  }
}
