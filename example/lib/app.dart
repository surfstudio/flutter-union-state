import 'package:example/example/example_screen.dart';
import 'package:flutter/material.dart';

/// App widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData.dark(),
      home: const ExampleScreen(),
    );
  }
}
