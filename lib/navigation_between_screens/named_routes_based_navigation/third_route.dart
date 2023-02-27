import 'package:flutter/material.dart';

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen when tapped.
            Navigator.pushNamed(context, '/fourth');
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}
