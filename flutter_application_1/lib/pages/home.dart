import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/collection.dart';
import 'package:flutter_application_1/pages/reccomend.dart';
import 'package:flutter_application_1/pages/recipe.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/pages/filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecipeModel> recipes = [];

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
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          searchField(),
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
        recipeListView(context),
      ],
    );
  }

  Column popularSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader(context, 'Popular Recipes'),
        recipeListView(context),
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
              // Navigate to a new page or perform other actions
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Reccomendations()),
              );
            },
            child: Text(
              'See All',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.blue, // Set text color to blue
                fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                fontWeight:
                    Theme.of(context).textTheme.headlineSmall?.fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox recipeListView(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Handle recipe tap
              onRecipeTap(recipes[index]);
              print('Recipe ${recipes[index].name} clicked');
            },
            child: recipeContainer(context, index),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemCount: recipes.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      ),
    );
  }

  Container recipeContainer(BuildContext context, int index) {
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
          SizedBox(
            height: 210, // Fixed height for all images
            width: double.infinity, // Full width of the container
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                recipes[index].iconPath,
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
              constraints: BoxConstraints(
                maxHeight: 150, // Adjust the maximum height as needed
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

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).cardColor,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Filter()));
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Filter.svg'),
            ),
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
        style: Theme.of(context).textTheme.titleLarge,
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
    // Navigate to recipe details page with the selected recipe
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Recipe(selectedRecipe: recipe),
      ),
    );
  }
}
