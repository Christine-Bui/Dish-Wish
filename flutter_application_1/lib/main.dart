import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/text_size_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TextSizeModel(),
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        textTheme:
            GoogleFonts.jetBrainsMonoTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
