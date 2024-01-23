import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';

class Recipe extends StatefulWidget {
  final RecipeModel selectedRecipe;

  const Recipe({required this.selectedRecipe});

  @override
  State<StatefulWidget> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            SizedBox.fromSize(
              size: const Size.fromHeight(300),
              child: Image.asset(
                widget.selectedRecipe.iconPath,
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
                    widget.selectedRecipe.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.selectedRecipe.about,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Ingredients:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  // Display Ingredients using Column
                  for (String ingredient in widget.selectedRecipe.ingredients)
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '$ingredient',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  const SizedBox(height: 5),
                  Text(
                    'Instructions:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  // Display Instructions using Column
                  for (String instruction in widget.selectedRecipe.instructions)
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '$instruction',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        backgroundColor: Theme.of(context).cardColor,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
