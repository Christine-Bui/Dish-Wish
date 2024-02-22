import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/app_setttings_model.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'package:flutter_application_1/pages/faq.dart';
import 'package:flutter_application_1/pages/recents.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Settings',
                  style: Theme.of(context).textTheme.titleLarge)),
          const SizedBox(height: 15),
          helpSettings('Recently Viewed'),
          const SizedBox(height: 20),
          appSettingsWidget(),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Help & Support',
                  style: Theme.of(context).textTheme.headlineMedium)),
          const SizedBox(height: 20),
          helpSettings('Frequently Asked Questions'),
          const SizedBox(height: 10),
          helpSettings('About Us'),
        ],
      ),
    );
  }

  Column appSettingsWidget() {
    final appSettings = Provider.of<AppSettingsModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'App Settings',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
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
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Switch(
                value: appSettings.darkMode,
                onChanged: (bool value) {
                  appSettings.toggleDarkMode();
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        textSizeControl(), // Slider to control text size
      ],
    );
  }

  Widget textSizeControl() {
    final appSettings = Provider.of<AppSettingsModel>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Text Size',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('A',
                  style: GoogleFonts.jetBrainsMono(fontSize: 16)), // Small "A"
              Expanded(
                child: Slider(
                  min: 10,
                  max: 20,
                  divisions: 20,
                  value: appSettings.textSize,
                  onChanged: (newSize) {
                    appSettings.setTextSize(newSize);
                  },
                ),
              ),
              Text('A',
                  style: GoogleFonts.jetBrainsMono(fontSize: 24)), // Large "A"
            ],
          ),
        ],
      ),
    );
  }

  Widget helpSettings(String title) {
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
        GestureDetector(
          onTap: () {
            if (title == 'Frequently Asked Questions') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Faq()),
              );
            } else if (title == 'About Us') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );
            } else {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Recents()),
                );
              }
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar();
  }
}
