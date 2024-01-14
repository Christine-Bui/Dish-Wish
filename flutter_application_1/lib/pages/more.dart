import 'package:flutter/material.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'More',
        home: Scaffold(
          appBar: AppBar(
            title: Text('More'),
          ),
          body: Text("More"),
        ));
  }
}
