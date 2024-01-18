import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/text_size_model.dart';
import 'package:provider/provider.dart';
// Other imports remain the same...

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool _darkTheme = false; // Get the current text size
  // Default text size

  @override
  Widget build(BuildContext context) {
    double textSize = Provider.of<TextSizeModel>(context).textSize;
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: textSize, // Use _textSize here
                    fontWeight: FontWeight.w600,
                  ))),
          const SizedBox(height: 10),
          AppSettings(textSize),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Help & Support',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: textSize, // Slightly smaller text size
                    fontWeight: FontWeight.w600,
                  ))),
          const SizedBox(height: 10),
          H_S('Frequently Asked Questions', textSize),
          const SizedBox(height: 10),
          H_S('About Us', textSize),
        ],
      ),
    );
  }

  Column AppSettings(double textSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'App Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize, // Use _textSize here
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize, // Use _textSize here
                  fontWeight: FontWeight.w400,
                ),
              ),
              Switch(
                value: _darkTheme,
                onChanged: (bool value) {
                  setState(() {
                    _darkTheme = value;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        textSizeControl(textSize), // Slider to control text size
      ],
    );
  }

  Widget textSizeControl(double textSize) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Text Size',
            style: TextStyle(
              color: Colors.black,
              fontSize: textSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          Slider(
            min: 16,
            max: 22,
            divisions: 6,
            value: textSize,
            onChanged: (newSize) {
              Provider.of<TextSizeModel>(context, listen: false)
                  .setTextSize(newSize);
            },
          ),
        ],
      ),
    );
  }

  Column H_S(String title, double textSize) {
    // Accept a String parameter
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar();
  }
}

void main() {
  runApp(const MaterialApp(
    home: SettingsPage(),
  ));
}
