import 'package:flutter/material.dart';

class AllRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'All Reccomendations',
        home: Scaffold(
          appBar: AppBar(
            title: Text('All Reccomendations'),
          ),
          body: Text("All Reccomendations"),
        ));
  }
}
