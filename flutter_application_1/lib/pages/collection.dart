import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectionPage extends StatefulWidget {
  CollectionPage({super.key});
  final Map<String, List<String>> galleries = {
    'Favorites': ['1', '2', '3', '4'],
    'Other': ['5', '6', '7', '8'],
    // Add more categories as needed
  };

  @override
  State<CollectionPage> createState() => _CollectionPage();
}

class _CollectionPage extends State<CollectionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
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
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
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
    );
  }

  Widget _buildGallery() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: widget.galleries.length,
      itemBuilder: (context, index) {
        var category = widget.galleries.keys.elementAt(index);
        var imageIndices = widget.galleries[category]!;
        return _buildFolder(context, category, imageIndices);
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
          color: Colors.white,
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
                  Expanded(child: _buildMiniImage(context, imageIndices[2])),
                  Expanded(child: _buildMiniImage(context, imageIndices[3])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
          image: AssetImage('assets/icons/$imageIndex.jpg'),
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
