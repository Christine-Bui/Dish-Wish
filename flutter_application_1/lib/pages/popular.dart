import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_application_1/pages/recipe.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<RecipeModel> recipes = [];

  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  void getInitialInfo() async {
    List<RecipeModel> fetchedRecipes = await RecipeModel.fetchMostViewedData(context);
    setState(() {
      recipes = fetchedRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What's Popular?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0,
      ),
      body: recipes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                                    size: const Size.fromRadius(60),
                                    child: Image.network(
                                      recipes[index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          recipes[index].name,
                                          style: Theme.of(context).textTheme.headlineSmall,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        height: 80, // Adjust the height as needed
                                        child: SingleChildScrollView(
                                          child: Text(
                                            recipes[index].description,
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ),
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
    home: Popular(),
  ));
}
