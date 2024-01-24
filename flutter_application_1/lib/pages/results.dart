import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Results extends StatefulWidget {
  const Results({super.key});
  @override
  State<Results> createState() => _Results();
}

class _Results extends State<Results> {
  List<RecipeModel> recipes = [];

  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  void getInitialInfo() async {
  List<RecipeModel> fetchedRecipes = await RecipeModel.fetchData(context);
  recipes = fetchedRecipes;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor, // Set the background color for the entire screen
      appBar: AppBar(
        title: const Text(
          'Dish Wish', 
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                  hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/Search.svg'),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            ),
          ),
          const SizedBox(height: 20), // Adjust the spacing between the search bar and other content
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Results',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            // Wrapping ListView in Expanded
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 238,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        blurRadius: 8, // Blur radius
                        offset: const Offset(3, 6), // Offset in x and y axis
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(20),
                        //   child: SizedBox.fromSize(
                        //     size: const Size.fromRadius(150),
                        //     child: Image.asset(
                        //       recipes[index].iconPath,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 10), // Adjust the spacing between image and text
                        Text(
                          recipes[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5), // Adjust the spacing between text and description
                        Text(
                          recipes[index].description,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
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
}

void main() {
  runApp(const MaterialApp(
    home: Results(),
  ));
}
