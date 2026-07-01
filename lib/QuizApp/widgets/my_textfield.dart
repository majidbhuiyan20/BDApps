import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.controller, required this.label, this.showNumberKeyboardOnly = false});
  final TextEditingController controller;
  final String label;
  final bool showNumberKeyboardOnly;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      keyboardType: showNumberKeyboardOnly ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
