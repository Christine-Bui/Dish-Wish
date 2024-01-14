import 'package:flutter/material.dart';

class RecipeModel {
  String name;
  String iconPath;
  RecipeModel({
    required this.name,
    required this. iconPath,
  });
  static List<RecipeModel> getRecipes(){
    List<RecipeModel> recipes = [];

    recipes.add(
      RecipeModel(
        name: 'Pho Bo',
        iconPath: 'assets/icons/pho.jpg'
        )
      );

      recipes.add(
        RecipeModel(
          name: 'Banh Xeo',
          iconPath: 'assets/icons/xeo.jpg'
          )
        );

      recipes.add(
        RecipeModel(
          name: 'Pho Ga',
          iconPath: 'assets/icons/pho ga.jpg'
          )
        );
  }
}