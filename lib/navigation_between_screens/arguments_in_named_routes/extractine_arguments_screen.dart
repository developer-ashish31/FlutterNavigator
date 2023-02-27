import 'package:flutter/material.dart';
import 'package:navigator_sample/navigation_between_screens/arguments_in_named_routes/screen_arguments.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extract Arguments Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(args.title),
            Text(args.message),
          ],
        ),
      ),
    );
  }
}