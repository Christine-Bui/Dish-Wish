import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_application_1/pages/collection.dart';
import 'package:flutter_application_1/pages/reccomend.dart';
import 'package:flutter_application_1/pages/recipe.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/pages/search_bar.dart' as custom; 

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecipeModel> recipes = [];
  bool _isSearchClicked = false;
  bool _searchByIngredients = false;
  List<String> _matchingIngredients = [];
  List<String> _selectedIngredients = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  void getInitialInfo() async {
    List<RecipeModel> fetchedRecipes = await RecipeModel.fetchData(context);
    setState(() {
      recipes = fetchedRecipes;
    });
  }

  Future<List<String>> fetchMatchingIngredients(String searchTerm) async {
  // Simulated list of ingredients for demonstration
  List<String> allIngredients = [
    'Tomato',
    'Potato',
    'Onion',
    'Garlic',
    'Bell Pepper',
    'Carrot',
    'Broccoli',
    'Spinach',
    'Lettuce',
    'Cucumber',
  ];

  // Filter ingredients based on search term
  List<String> matchingIngredients = allIngredients
      .where((ingredient) =>
          ingredient.toLowerCase().contains(searchTerm.toLowerCase()))
      .toList();

  return matchingIngredients;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          searchField(context),
          const SizedBox(height: 30),
          recommendSection(context),
          const SizedBox(height: 30),
          popularSection(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Column recommendSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader(context, 'Recommended Recipes'),
        recipeListView(context, recipes), // Pass recipes to the list view
      ],
    );
  }

  Column popularSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader(context, 'Popular Recipes'),
        recipeListView(context, recipes), // Pass recipes to the list view
      ],
    );
  }

  Padding sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Reccomendations()),
              );
            },
            child: Text(
              'See All',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.blue,
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox recipeListView(BuildContext context, List<RecipeModel> recipes) {
    int itemCount = recipes.length < 10 ? recipes.length : 10;

    return SizedBox(
      height: 350,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              addRecent(recipes[index]);
              onRecipeTap(recipes[index]);
            },
            child: recipeContainer(context, index, recipes),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      ),
    );
  }

  Container recipeContainer(
      BuildContext context, int index, List<RecipeModel> recipes) {
    return Container(
      width: 238,
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
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(108),
              child: Image.network(
                recipes[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            recipes[index].name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150,
              ),
              child: SingleChildScrollView(
                child: Text(
                  recipes[index].description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }     
  
Widget searchField(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      custom.SearchBar(
        onTap: () {
          setState(() {
            _isSearchClicked = true;
          });
        },
        controller: _searchController,
        onChanged: (value) async {
          if (_searchByIngredients) {
            List<String> ingredients = await fetchMatchingIngredients(value);
            setState(() {
              _matchingIngredients = ingredients;
            });
          }
        },
      ),
      if (_isSearchClicked)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text('By Ingredients'),
                value: _searchByIngredients,
                onChanged: (newValue) {
                  setState(() {
                    _searchByIngredients = newValue ?? false;
                    if (!_searchByIngredients) {
                      _matchingIngredients = [];
                      _searchController.clear();
                    }
                  });
                },
              ),
              if (_searchByIngredients && _matchingIngredients.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Matching Ingredients:',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _matchingIngredients.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(_matchingIngredients[index]),
                          value: _selectedIngredients.contains(_matchingIngredients[index]),
                          onChanged: (newValue) {
                            setState(() {
                              if (newValue ?? false) {
                                _selectedIngredients.add(_matchingIngredients[index]);
                              } else {
                                _selectedIngredients.remove(_matchingIngredients[index]);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
    ],
  );
}


  AppBar appBar() {
    return AppBar(
      title: Text(
        "Dish Wish",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      elevation: 0.0,
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.favorite),
          tooltip: 'Show Liked',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CollectionPage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Show More',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ],
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
