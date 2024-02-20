import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectionPage extends StatefulWidget {
  CollectionPage({Key? key}) : super(key: key);

  final Map<String, List<String>> galleries = {
    'Favorites': ['1', '2', '3', '4'],
    // Add more categories as needed
  };

  @override
  State<CollectionPage> createState() => _CollectionPage();
}

class _CollectionPage extends State<CollectionPage> {
  List<RecipeModel> recipes = [];
  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  void getInitialInfo() async {
    List<RecipeModel> fetchedRecipes = favorites;
    recipes = fetchedRecipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Collections',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          searchField(),
          const SizedBox(height: 30),
          Expanded(
            child: _buildGallery(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the action when the plus icon is tapped
          print('Add Collection tapped');
          // Add your logic to add collections here
        },
        child: const Icon(Icons.add),
        backgroundColor:
            Theme.of(context).cardColor, // Customize the background color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
            hintStyle: Theme.of(context).textTheme.bodySmall,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  Widget _buildGallery() {
    var favoriteRecipes = recipes;
    var favoriteImageUrls =
        favoriteRecipes.map((recipe) => recipe.image_url).toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: widget.galleries.length, // The number of categories to display
      itemBuilder: (context, index) {
        return _buildFolder(context, "Favorites", favoriteImageUrls);
      },
    );
  }

  Widget _buildFolder(
      BuildContext context, String category, List<String> imageIndices) {
    return GestureDetector(
      onTap: () {
        // Handle folder tap
        print('Folder tapped: $category');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(3, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildMiniImage(context, imageIndices[0])),
                  Expanded(child: _buildMiniImage(context, imageIndices[1])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Expanded(child: _buildMiniImage(context, imageIndices[2])),
                  // Expanded(child: _buildMiniImage(context, imageIndices[3])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniImage(BuildContext context, String imageIndex) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: Image.network(imageIndex).image,
          // image: AssetImage('assets/icons/$imageIndex.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CollectionPage(),
  ));
}
