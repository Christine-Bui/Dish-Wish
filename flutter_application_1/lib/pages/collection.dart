import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Collection',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Yellow Lab'),
          ),
          body: Text("Collection"),
        ));
  }
}
