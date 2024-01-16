import 'package:flutter/material.dart';

class Reccomendations extends StatelessWidget {
  const Reccomendations({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'All Reccomendations',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('All Reccomendations'),
          ),
          body: const Text("All Reccomendations"),
        ));
  }
}
