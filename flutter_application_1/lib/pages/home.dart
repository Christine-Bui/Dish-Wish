import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_application_1/pages/collection.dart';
import 'package:flutter_application_1/pages/reccomend.dart';
import 'package:flutter_application_1/pages/recipe.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/pages/selection.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  List<String> typedIngredients = [];
  Set<String> selectedIngredients = {};
  bool isFilterOpen = false;
  List<RecipeModel> recipes = [];
  List<String> ingredients = [
    'carrots',
    'celery',
    'butter',
    'fish',
    'lobsters',
    // Add more ingredients as needed
  ];
  bool isEnterPressed = false;

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          searchField(context, onIngredientsSelected),
          if (isFilterOpen) filterByIngredients(context),
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

   Widget filterByIngredients(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by Ingredients',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        // Display the list of typed ingredients dynamically
        if (typedIngredients.isNotEmpty)
          Wrap(
            children: typedIngredients.map((ingredient) {
              return Chip(
                label: Text(ingredient),
                deleteIcon: Icon(Icons.cancel),
                onDeleted: () {
                  setState(() {
                    typedIngredients.remove(ingredient);
                    onIngredientsSelected(typedIngredients);
                  });
                },
              );
            }).toList(),
          ),
        // You can replace the Chip with CheckboxListTile for selection
      ],
    ),
  );
}

Widget searchField(BuildContext context, Function(List<String>) onIngredientsSelected) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      onChanged: (value) {
        if (value.isEmpty) {
          
        } 
        // else if (value.endsWith('')){
        //   // If a word is completed (ends with space) and Enter is not pressed,
        //   // add it to the typed ingredients list
        //   setState(() {
        //     typedIngredients.add(value.trim());
            
        //   });     
        // }
        // Update the selected ingredients based on the typed ingredients
        onIngredientsSelected(typedIngredients);
        // Reset the flag whenever the text changes
        setState(() {
          isEnterPressed = false;
        });
      },
      onSubmitted: (value) {
        // Add the value as a chip only if it's not empty
        if (value.isNotEmpty) {
          if (value.contains(",")){
            setState(() {
              List<String> separatedIng = value.trim().split(',');
              typedIngredients.addAll(separatedIng);
              controller.clear();
            });
          }

          else{
            setState(() {
              typedIngredients.add(value.trim());
              controller.clear();
            });
        }
        }
        // Reset the flag
        // setState(() {
        //   isEnterPressed = true;
        // });
        // Handle the submitted value if needed
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).cardColor,
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset('assets/icons/Search.svg'),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.filter_list, color: isFilterOpen ? Colors.black : Colors.grey),
          onPressed: () {
            setState(() {
              isFilterOpen = !isFilterOpen;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    ),
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

  void onIngredientsSelected(List<String> selectedIngredients) {
  // Implement the logic to handle the selected ingredients
  // For example, you can update the state or perform any other action
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
