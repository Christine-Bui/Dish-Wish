import 'dart:convert';
import 'package:flutter/material.dart';

var recentlyViewed = List<RecipeModel>.empty(growable: true);
var favorites = List<RecipeModel>.empty(growable: true);

class RecipeModel {
  String name;
  String author;
  String imageUrl;
  String url;
  String description;
  List<String> ingredients;
  List<String> method;
  int viewCount; // Add viewCount property

  RecipeModel({
    required this.name,
    required this.imageUrl,
    required this.url,
    required this.description,
    required this.author,
    required this.ingredients,
    required this.method,
    this.viewCount = 0, // Initialize viewCount with a default value
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json['Name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      url: json['url'] ?? '',
      description: json['Description'] ?? '',
      author: json['Author'] ?? '',
      ingredients: List<String>.from(json['Ingredients'] ?? []),
      method: List<String>.from(json['Method'] ?? []),
    );
  }

  static Future<List<RecipeModel>> fetchData(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/recipes/recipes3.json');
    List<dynamic> jsonArray = json.decode(jsonString);

    List<RecipeModel> recipes =
        jsonArray.map((json) => RecipeModel.fromJson(json)).toList();

    return recipes;
  }

  static Future<List<RecipeModel>> fetchMostViewedData(BuildContext context) async {
    // Assuming fetching from the same JSON for demo purposes
    return fetchData(context);
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<List<RecipeModel>>(
        future: RecipeModel.fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No recipes found.');
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

  const RecipeTile({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(recipe.imageUrl),
      title: Text(recipe.name),
      subtitle: Text(recipe.description),
      onTap: () {
        // Handle recipe tap
      },
    );
  }
}

void addToFavorites(RecipeModel recipe) {
  if (favorites.contains(recipe)) {
    favorites.remove(recipe);
  } else {
    favorites.add(recipe);
  }
}

void addRecent(RecipeModel recipe) {
  if (recentlyViewed.length == 10) {
    recentlyViewed.removeLast();
  }
  if (recentlyViewed.contains(recipe)) {
    if (recipe == recentlyViewed[0]) return;
    recentlyViewed.remove(recipe);
    recentlyViewed.insert(0, recipe);
    return;
  }
  recentlyViewed.insert(0, recipe);
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter JSON Card Example'),
        ),
        body: const MyCard(),
      ),
    );
  }
}
