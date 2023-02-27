import 'package:flutter/material.dart';

class PassArgumentsScreen extends StatelessWidget {
  const PassArgumentsScreen(
      {super.key, required this.title, required this.message});

  final String title;
  final String message;

  static const routeName = '/passArguments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extract Arguments Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text(message),
          ],
        ),
      ),
    );
  }
}
