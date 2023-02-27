import 'package:flutter/material.dart';
import 'package:navigator_sample/navigation_between_screens/sending_data_using_route_setting/todo_model.dart';

class ToDoDetailScreen extends StatelessWidget {

  /// unComment below todo if Using Route Settings
  const ToDoDetailScreen({super.key});

  // In the constructor, require a Todo.
  // const ToDoDetailScreen({super.key, required this.todo});

  /// Comment below todo if Using Route Settings
  // Declare a field that holds the Todo.
  // final ToDo todo;

  @override
  Widget build(BuildContext context) {

    /// unComment below todo if Using Route Settings
    final todo = ModalRoute.of(context)!.settings.arguments as ToDo;


    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}