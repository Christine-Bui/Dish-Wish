import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';

class Recipe extends StatefulWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  List<RecipeModel> recipes = [];
  int selectedRecipeIndex = 0; // Set the default selected recipe index
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  void getInitialInfo() {
    recipes = RecipeModel.getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    RecipeModel selectedRecipe = recipes[selectedRecipeIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            SizedBox.fromSize(
              size: const Size.fromHeight(300), // Set the desired height for the image
              child: Image.asset(
                selectedRecipe.iconPath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 320, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedRecipe.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    selectedRecipe.about,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Ingredients:',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Display Ingredients using Column
                  for (String ingredient in selectedRecipe.ingredients)
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '• $ingredient',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  const SizedBox(height: 5),
                  Text(
                    'Instructions:',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Display Instructions using Column
                  for (int i = 0; i < selectedRecipe.instructions.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '${i + 1}. ${selectedRecipe.instructions[i]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20), // Add bottom padding after instructions
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Recipe(),
  ));
}
