import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  final Map<String, List<String>> galleries = {
    'Favorites': ['1', '2', '3', '4'],
    'Other': ['5', '6', '7', '8'],
    // Add more categories as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collections'),
      ),
      body: _buildGallery(),
    );
  }

  Widget _buildGallery() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: galleries.length,
      itemBuilder: (context, index) {
        var category = galleries.keys.elementAt(index);
        var imageIndices = galleries[category]!;
        return _buildFolder(context, category, imageIndices);
      },
    );
  }

  Widget _buildFolder(BuildContext context, String category, List<String> imageIndices) {
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
              offset: Offset(3, 6),
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
                style: TextStyle(
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
      margin: EdgeInsets.all(2),
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
