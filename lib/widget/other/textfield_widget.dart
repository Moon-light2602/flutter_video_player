import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const TextFieldWidget({super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      );
}
