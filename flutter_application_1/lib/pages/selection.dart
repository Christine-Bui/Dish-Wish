import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  final Function(List<String>) onIngredientsSelected; // Declare callback function
  const Selection({Key? key, required this.onIngredientsSelected}) : super(key: key);

  @override
  State<Selection> createState() => _Selection();
}

class _Selection extends State<Selection> {
  final List<Map<String, dynamic>> ingredients = [
    {'name': 'Basil', 'imageUrl': 'https://img.icons8.com/color/48/basil.png'},
    {
      'name': 'Carrots',
      'imageUrl': 'https://img.icons8.com/color/48/carrot.png'
    },
    {
      'name': 'Cauliflower',
      'imageUrl': 'https://img.icons8.com/color/48/cauliflower.png'
    },
    // Add the rest of the ingredients with their image URLs here...
  ];

  final Set<String> selectedIngredients = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search by Ingredients',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: const [
          // IconButton(
          //   icon: Icon(Icons.filter_list),
          //   onPressed: () {
          //     // Add filter action here
          //   },
          // ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                var ingredient = ingredients[index];
                bool isSelected =
                    selectedIngredients.contains(ingredient['name']);
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 1,
                  shadowColor: Colors.black.withOpacity(0.5),
                  child: ListTile(
                    leading: Image.network(
                      ingredient['imageUrl'],
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        // Placeholder image or Icon when image fails to load
                        return const Icon(Icons.error);
                      },
                    ),
                    title: Text(
                      ingredient['name'],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Checkbox(
                      value: isSelected,
                      onChanged: (bool? newValue) {
                        setState(() {
                          if (newValue ?? false) {
                            selectedIngredients.add(ingredient['name']);
                          } else {
                            selectedIngredients.remove(ingredient['name']);
                          }
                        });
                        widget.onIngredientsSelected(selectedIngredients.toList()); // Pass selected ingredients to the callback
                      },
                    ),
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIngredients.remove(ingredient['name']);
                        } else {
                          selectedIngredients.add(ingredient['name']);
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
