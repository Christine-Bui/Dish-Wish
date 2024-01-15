
class RecipeModel {
  String name;
  String iconPath;
  String description;

  RecipeModel({
    required this.name,
    required this. iconPath,
    required this. description,
  });

  static List<RecipeModel> getRecipes(){
    List<RecipeModel> recipes = [];

    recipes.add(
      RecipeModel(
        name: 'Pho Bo',
        iconPath: 'assets/icons/1.jpg',
        description: 'Traditional Vietnamese beef noodle soup.',
        )
      );

      recipes.add(
        RecipeModel(
          name: 'Banh Xeo',
          iconPath: 'assets/icons/3.jpg',
          description: 'Vietnamese sizzling crepes with shrimp and pork.',
          )
        );

      recipes.add(
        RecipeModel(
          name: 'Pho Ga',
          iconPath: 'assets/icons/2.jpg',
          description: 'Vietnamese chicken noodle soup.',
          )
        );
      return recipes;
  }
}