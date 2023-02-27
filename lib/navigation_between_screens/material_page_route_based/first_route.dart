import 'package:flutter/material.dart';
import 'package:navigator_sample/navigation_between_screens/material_page_route_based/second_route.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}
