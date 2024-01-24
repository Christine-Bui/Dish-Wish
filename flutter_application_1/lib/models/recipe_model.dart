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
    name: json['Name'] ?? '',
    url: json['url'] ?? '',
    description: json['Description'] ?? '',
    author: json['Author'] ?? '',
    ingredients: List<String>.from(json['Ingredients'] ?? []),
    method: List<String>.from(json['Method'] ?? []),
  );
}

  static Future<List<RecipeModel>> fetchData(BuildContext context) async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/recipes/recipes2.json');
    List<dynamic> jsonArray = json.decode(jsonString);

    List<RecipeModel> recipes = jsonArray.map((json) => RecipeModel.fromJson(json)).toList();

    return recipes;
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<List<RecipeModel>>(
        future: RecipeModel.fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No recipes found.');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return RecipeTile(recipe: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class RecipeTile extends StatelessWidget {
  final RecipeModel recipe;

  RecipeTile({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(recipe.name),
      subtitle: Text(recipe.description),
      onTap: () {
        // Handle recipe tap
        // You can navigate to a detailed view or perform other actions here
      },
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
