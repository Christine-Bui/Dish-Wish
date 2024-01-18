import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(Selection());
}

class Selection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IngredientListPage(),
    );
  }
}

class IngredientListPage extends StatefulWidget {
  @override
  _IngredientListPageState createState() => _IngredientListPageState();
}

class _IngredientListPageState extends State<IngredientListPage> {
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Ingredients'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Add filter action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          searchField(),
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
                        return Icon(Icons.error);
                      },
                    ),
                    title: Text(ingredient['name']),
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
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Filter.svg'),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
