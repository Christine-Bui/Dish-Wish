// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_application_1/models/collection_model.dart';

// class CollectionPage extends StatefulWidget {
//   const CollectionPage({super.key});
//   @override
//   State<CollectionPage> createState() => _CollectionPage();
// }

// class _CollectionPage extends State<CollectionPage> {
//   List<CollectionModel> collections = [];

//   void getInitialInfo() {
//     collections = CollectionModel.getCollections();
//   }

//   @override
//   Widget build(BuildContext context) {
//     getInitialInfo();
//     return Scaffold(
//       body: _buildImageColumn(),
//     );
//   }
// }

// Widget _buildImageColumn() {
//   return Container(
//     decoration: const BoxDecoration(
//       color: Colors.transparent,
//     ),
//     child: Column(
//       children: [
//         _buildImageRow(1),
//         _buildImageRow(3),
//       ],
//     ),
//   );
// }

// Widget _buildDecoratedImage(int imageIndex, double boxSize) => Expanded(
//   child: Container(
//     width: boxSize,
//     height: boxSize,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.1), // Shadow color
//           blurRadius: 8, // Blur radius
//           offset: Offset(3, 6), // Offset in x and y axis
//         ),
//       ],
//     ),
//     margin: const EdgeInsets.all(4),
//     child: Image.asset('assets/icons/$imageIndex.jpg', fit: BoxFit.cover),
//   ),
// );

// Widget _buildImageRow(int imageIndex) => Row(
//   children: [
//     _buildDecoratedImage(imageIndex, 180.0),
//     _buildDecoratedImage(imageIndex + 1,  180.0),
//   ],
// );

import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  final Map<String, List<String>> galleries = {
    'Nature': ['1', '2', '3', '4'],
    'City': ['5', '6', '7', '8'],
    // Add more categories as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: _buildGallery(context),
    );
  }

  Widget _buildGallery(BuildContext context) {
    return ListView(
      children: [
        for (var category in galleries.keys)
          _buildFolder(context, category, galleries[category]!),
      ],
    );
  }

  Widget _buildFolder(BuildContext context, String category, List<String> imageIndices) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          _buildImageRow(context, imageIndices),
        ],
      ),
    );
  }

  Widget _buildImageRow(BuildContext context, List<String> imageIndices) {
    return Row(
      children: [
        for (var index in imageIndices) _buildMiniImage(context, index),
      ],
    );
  }

  Widget _buildMiniImage(BuildContext context, String imageIndex) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 16,
      height: MediaQuery.of(context).size.width / 4,
      margin: EdgeInsets.only(right: 8, bottom: 8),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/icons/$imageIndex.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

