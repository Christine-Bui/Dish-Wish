import 'package:flutter/material.dart';

class Reccomendations extends StatefulWidget {
  const Reccomendations({super.key});

  @override
  State<Reccomendations> createState() => _Recommendations();
}

class _Recommendations extends State<Reccomendations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Reccomendations'),
      ),
      body: const Text("All Reccomendations"),
    );
  }
}
