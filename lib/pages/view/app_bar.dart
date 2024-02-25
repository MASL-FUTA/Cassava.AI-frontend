import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final Function() func;
  const AppBackButton({super.key, required this.func});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: func,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 2),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 15),
        ),
      ),
    );
  }
}