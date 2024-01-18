import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is the color of the background of the app
      appBar: AppBar(
        // This is the color of the AppBar
        elevation: 0,
        title: Text(
          'About Us',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Column with text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            30), // Increased radius for more rounded corners
                        child: Image.asset(
                          'assets/icons/contributors.png', // Replace with your image asset path
                          fit: BoxFit
                              .cover, // Changed to cover to maintain aspect ratio of the image
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Dish Wish is an idea that came to mind to solve the issue of not knowing what to make when you dont have many ingredients. With our Computer Science skills and our hobby of improving our skills we developed Dish Wish.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "A multi-platform app that helps to solve this issue we all face. It's coded using Flutter by Google.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Acknowledgments for making this app come to life:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '• Jeet Patel',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '• Christine Bui',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: About(),
  ));
}
