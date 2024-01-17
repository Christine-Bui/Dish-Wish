import 'package:flutter/material.dart';
// Other imports remain the same...

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool _darkTheme = false;
  double _textSize = 16; // Default text size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: _textSize + 8, // Use _textSize here
                    fontWeight: FontWeight.w600,
                  ))),
          const SizedBox(height: 10),
          appSettings(),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: const Text('Help & Support',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: _textSize + 2, // Slightly smaller text size
                    fontWeight: FontWeight.w600,
                  ))),
          const SizedBox(height: 10),
          H_S('Frequently Asked Questions'),
          const SizedBox(height: 10),
          H_S('About Us'),
        ],
      ),
    );
  }

  Column appSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'App Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _textSize + 2, // Use _textSize here
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
                  fontSize: _textSize, // Use _textSize here
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
        textSizeControl(), // Slider to control text size
      ],
    );
  }

  Widget textSizeControl() {
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
        children: [
          Text(
            'Text Size',
            style: TextStyle(
              color: Colors.black,
              fontSize: _textSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          Slider(
            min: 12,
            max: 22,
            divisions: 4,
            value: _textSize,
            onChanged: (newSize) {
              setState(() {
                _textSize = newSize;
              });
            },
          ),
        ],
      ),
    );
  }

  Column H_S(String title) {
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
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: _textSize,
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
