import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_application_1/pages/recipe.dart';

class Recents extends StatefulWidget {
  const Recents({Key? key}) : super(key: key);

  @override
  State<Recents> createState() => _Recents();
}

class _Recents extends State<Recents> {
  List<RecipeModel> recipes = [];

  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  void getInitialInfo() async {
  RecipeModel recipe = await RecipeModel.fetchData(context);
  recipes = [recipe];
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recently Viewed',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(height: 15),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onRecipeTap(recipes[index]);
                    print('Recipe ${recipes[index].name} clicked');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(3, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(75),
                              child: Image.asset(
                                recipes[index].iconPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipes[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  recipes[index].description,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 25,
              ),
              itemCount: recipes.length,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            ),
          ),
        ],
      ),
    );
  }

  void onRecipeTap(RecipeModel recipe) {
    // Navigate to recipe details page with the selected recipe
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Recipe(selectedRecipe: recipe),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Recents(),
  ));
}
