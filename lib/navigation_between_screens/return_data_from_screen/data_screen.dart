import 'package:flutter/material.dart';
import 'package:navigator_sample/navigation_between_screens/return_data_from_screen/selection_button.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  static const routeName = '/dataScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Returning Data Demo'),
      ),
      // Create the SelectionButton widget in the next step.
      body: const Center(
        child: SelectionButton(),
      ),
    );
  }
}