import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/models/collection_model.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});
  @override
  State<CollectionPage> createState() => _CollectionPage();
}

class _CollectionPage extends State<CollectionPage> {
  List<CollectionModel> collections = [];

  void getInitialInfo() {
    collections = CollectionModel.getCollections();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      body: _buildImageColumn(),
    );
  }
}

Widget _buildImageColumn() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.black26,
    ),
    child: Column(
      children: [
        _buildImageRow(1),
        _buildImageRow(3),
      ],
    ),
  );
}

Widget _buildDecoratedImage(int imageIndex) => Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: Image.asset('assets/icons$imageIndex.jpg'),
      ),
    );

Widget _buildImageRow(int imageIndex) => Row(
      children: [
        _buildDecoratedImage(imageIndex),
        _buildDecoratedImage(imageIndex + 1),
      ],
    );
