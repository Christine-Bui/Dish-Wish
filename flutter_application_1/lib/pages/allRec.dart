import 'package:flutter/material.dart';

class AllRec extends StatelessWidget {
  const AllRec({super.key});

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
