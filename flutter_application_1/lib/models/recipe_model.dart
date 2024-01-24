import 'dart:convert';
import 'package:flutter/material.dart';

class RecipeModel {
  String name;
  String author;
  String url;
  String description;
  List<String> ingredients;
  List<String> method;

  RecipeModel({
    required this.name,
    required this.url,
    required this.description,
    required this.author,
    required this.ingredients,
    required this.method,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json['Name'],
      url: json['url'],
      description: json['Description'],
      author: json['Author'],
      ingredients: List<String>.from(json['Ingredients']),
      method: List<String>.from(json['Method']),
    );
  }

  static Future<RecipeModel> fetchData(BuildContext context) async {
    // Replace 'assets/recipes/recipes2.json' with the actual path to your JSON file
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/recipes/recipes2.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    return RecipeModel.fromJson(jsonMap);
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<RecipeModel>(
        future: RecipeModel.fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(snapshot.data!.name),
                  subtitle: Text(snapshot.data!.description),
                ),
                // Add widgets to display other properties like author, url, ingredients, and method
              ],
            );
          }
        },
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter JSON Card Example'),
        ),
        body: MyCard(),
      ),
    );
  }
}
