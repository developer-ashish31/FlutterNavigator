import 'package:flutter/material.dart';
import 'package:navigator_sample/navigation_between_screens/sending_data_using_route_setting/todo_detail_screen.dart';
import 'package:navigator_sample/navigation_between_screens/sending_data_using_route_setting/todo_model.dart';

class TodosScreen extends StatelessWidget {
  // Requiring the list of todos.
  const TodosScreen({super.key, required this.todos});

  final List<ToDo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      //passing in the ListView.builder
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  /*MaterialPageRoute(
                      builder: (context) =>
                          ToDoDetailScreen(todo: todos[index])),*/
                    MaterialPageRoute(
                      builder: (context) => const ToDoDetailScreen(),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                        arguments: todos[index],
                      ),
                    ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 16,
              height: 1.0,
              thickness: 1.0,
            );
          },
          itemCount: todos.length),
    );
  }
}
