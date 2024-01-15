import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Settings Page',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: const Text("Settings Page"),
        ));
  }
}
