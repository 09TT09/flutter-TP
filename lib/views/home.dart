import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Page'),
        backgroundColor: Colors.blue, // Customize the app bar color if needed.
      ),
      body: const Center(
        child: Text(
          'This is a simple page with just a text widget.',
          style: TextStyle(
            fontSize: 20.0, // Customize the font size if needed.
          ),
        ),
      ),
    );
  }
}