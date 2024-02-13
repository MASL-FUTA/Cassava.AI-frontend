import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // To prevent our app from entering the status bar
        child: Center(
          child: Container(
            height: 250,
            width: 250,
            color: Colors.yellow,
            child: Center(child: Text("Hello World")),
          ),
        ),
      ),
    );
  }
}
