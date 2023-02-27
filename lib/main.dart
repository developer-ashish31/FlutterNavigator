import 'package:flutter/material.dart';
import 'package:navigator_sample/animation/detail_screen.dart';
import 'package:navigator_sample/navigation_between_screens/arguments_in_named_routes/extractine_arguments_screen.dart';
import 'package:navigator_sample/navigation_between_screens/arguments_in_named_routes/screen_arguments.dart';
import 'package:navigator_sample/navigation_between_screens/generated_route_arguments_extraction/pass_arguments_screen.dart';
import 'package:navigator_sample/navigation_between_screens/material_page_route_based/first_route.dart';
import 'package:navigator_sample/navigation_between_screens/named_routes_based_navigation/fourth_route.dart';
import 'package:navigator_sample/navigation_between_screens/named_routes_based_navigation/third_route.dart';
import 'package:navigator_sample/navigation_between_screens/return_data_from_screen/data_screen.dart';
import 'package:navigator_sample/navigation_between_screens/sending_data_using_route_setting/todo_list_screen.dart';
import 'package:navigator_sample/navigation_between_screens/sending_data_using_route_setting/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (route) {
        if (route.name == PassArgumentsScreen.routeName) {
          final args = route.arguments as ScreenArguments;
          return MaterialPageRoute(builder: (context) {
            return PassArgumentsScreen(
                title: args.title, message: args.message);
          });
        }
        return null;
      },
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/third': (context) => const ThirdRoute(),
        '/fourth': (context) => const FourthRoute(),
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
        DataScreen.routeName: (context) => const DataScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DetailScreen();
                  }));
                },
                child: Hero(
                  tag: 'imageHero-computer',
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const FirstRoute();
                    }));
                  },
                  child: const Text('Route based navigation')),
              const SizedBox(height: 30),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  },
                  child: const Text('Named Route based navigation')),
              const SizedBox(height: 30),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ExtractArgumentsScreen.routeName,
                      arguments: ScreenArguments(
                        'Extract Arguments Screen - Sample',
                        'Sample - This message is extracted in the build method.',
                      ),
                    );
                  },
                  child: const Text('Named Route with Arguments navigation')),
              const SizedBox(height: 30),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PassArgumentsScreen.routeName,
                      arguments: ScreenArguments(
                        'Generated Route Arguments',
                        'Arguments passed using generated routes',
                      ),
                    );
                  },
                  child: const Text('Generated Route with Arguments navigation')),
              const SizedBox(height: 30),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      DataScreen.routeName,
                    );
                  },
                  child: const Text('Return Data from Screen / Route')),
              const SizedBox(height: 30),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TodosScreen(todos: ToDo.generateData())));
                  },
                  child: const Text('Send Data from one screen to another')),
              const SizedBox(height: 30),
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
