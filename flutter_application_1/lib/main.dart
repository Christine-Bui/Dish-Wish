import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/collection.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Settings(),
      theme: ThemeData(
        textTheme:
            GoogleFonts.jetBrainsMonoTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
