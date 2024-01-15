import 'package:flutter_application_1/models/recipe_model.dart';

class CollectionModel {
  RecipeModel recipeModel;
  String title;
  String subtitle;
  String image;

  CollectionModel({
    required this.recipeModel,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  static List<CollectionModel> getCollections() {
    List<CollectionModel> collections = [];
    collections.add(CollectionModel(
      recipeModel: RecipeModel(
        name: 'Pho Bo',
        iconPath: 'assets/icons/pho.jpg',
        description: 'Traditional Vietnamese beef noodle soup.',
      ),
      title: 'Dinner',
      subtitle: '8 recipes',
      image: 'assets/icons/pho.jpg',
    ));
    collections.add(CollectionModel(
      recipeModel: RecipeModel(
        name: 'Banh Xeo',
        iconPath: 'assets/icons/xeo.jpg',
        description: 'Vietnamese sizzling crepes with shrimp and pork.',
      ),
      title: 'Lunch',
      subtitle: '8 recipes',
      image: 'assets/icons/xeo.jpg',
    ));
    return collections;
  }
}
