import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';

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

  void getInitialInfo() async {
  RecipeModel recipe = await RecipeModel.fetchData(context);
  recipes = [recipe];
}

  Widget buildQuestionContainer(String question, String answer) {
    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 5),
            Text(
              answer,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('FAQ', // Add the title 'FAQ' to the AppBar
            style: Theme.of(context).textTheme.titleLarge),
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
                Text(
                  'Frequently Asked Questions',
                  style: Theme.of(context).textTheme.headlineLarge,
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
                    const SizedBox(height: 25),
                    buildQuestionContainer(
                      'How to search with ingredients?',
                      "Click on the filters icon in the search bar at top of the page and click on the option 'by ingredients'.",
                    ),
                    const SizedBox(height: 25),
                    buildQuestionContainer(
                      'How to delete from a collection?',
                      "Navigate to the 'Collections' page by first clicking on the heart icon in the top right of the screen then long press a collection for a pop-up dialog to appear and select the option to delete.",
                    ),
                    const SizedBox(height: 25),
                    buildQuestionContainer(
                      'How did Stardew Valley influence you?',
                      "It helped me learn about what to prioritize and how fun the game is.",
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemCount: 1,
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
    home: Faq(),
  ));
}
