import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _Faq();
}

class _Faq extends State<Faq> {
  List<RecipeModel> recipes = [];

  @override
  void initState() {
    super.initState();
    getInitialInfo();
  }

  void getInitialInfo() {
    recipes = RecipeModel.getRecipes();
  }

  Widget buildQuestionContainer(String question, String answer) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              answer,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'FAQ', // Add the title 'FAQ' to the AppBar
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                    children: [
                      buildQuestionContainer(
                        'How to add to a collection?',
                        "Navigate to the 'Collections' page by first clicking on the heart icon in the top right of the screen and then locate and click on the plus icon at the bottom right. Enter a name for the collection and press 'ok'.",
                      ),
                      SizedBox(height: 25),
                      buildQuestionContainer(
                        'How to search with ingredients?',
                        "Click on the filters icon in the search bar at top of the page and click on the option 'by ingredients'.",
                      ),
                      SizedBox(height: 25),
                      buildQuestionContainer(
                        'How to delete from a collection?',
                        "Navigate to the 'Collections' page by first clicking on the heart icon in the top right of the screen then long press a collection for a pop-up dialog to appear and select the option to delete.",
                      ),
                      SizedBox(height: 25),
                      buildQuestionContainer(
                        'How did Stardew Valley influence you?',
                        "It helped me learn about what to prioritize and how fun the game is.",
                      ),
                      SizedBox(height: 20),
                    ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 25),
              itemCount: 1,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Faq(),
  ));
}
