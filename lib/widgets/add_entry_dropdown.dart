import 'package:flutter/material.dart';

class TimeEntryDropdown extends StatefulWidget {
  const TimeEntryDropdown(
      {super.key,
      required this.items,
      required this.label,
      required this.onChange});

  final List<dynamic> items;
  final String label;
  final Function(String value) onChange;

  @override
  State<StatefulWidget> createState() {
    return _TimeEntryDropdown();
  }
}

class _TimeEntryDropdown extends State<TimeEntryDropdown> {
  String dropDownInitialvalue = '';

  @override
  void initState() {
    super.initState();
    dropDownInitialvalue = widget.items[0].id;
    widget.onChange(dropDownInitialvalue);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropDownInitialvalue,
      decoration: InputDecoration(labelText: widget.label),
      items: widget.items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.id,
          child: Text(value.name),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropDownInitialvalue = newValue!;
          widget.onChange(dropDownInitialvalue);
        });
      },
    );
  }
}
