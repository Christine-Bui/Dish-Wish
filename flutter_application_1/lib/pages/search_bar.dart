// search_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController controller;

  const SearchBar({
    Key? key,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        controller: controller,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).cardColor,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodySmall,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
