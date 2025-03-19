import 'package:flutter/material.dart';

class ToggleItem extends StatelessWidget {
  const ToggleItem({required this.title, required this.value, required this.onChanged, super.key});

  final bool value;
  final String title;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(value: value, title: Text(title), onChanged: onChanged);
  }
}
