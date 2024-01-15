import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'More',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('More'),
          ),
          body: const Text("More"),
        ));
  }
}
