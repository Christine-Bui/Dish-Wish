import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/app_setttings_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettingsModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettingsModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(appSettings.textSize, Brightness.light),
      darkTheme: _buildThemeData(appSettings.textSize, Brightness.dark),
      themeMode: appSettings.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }

  ThemeData _buildThemeData(double textSize, Brightness brightness) {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: brightness,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.jetBrainsMono(fontSize: textSize),
        titleMedium: GoogleFonts.jetBrainsMono(fontSize: textSize),
        titleSmall: GoogleFonts.jetBrainsMono(fontSize: textSize),
        headlineLarge: GoogleFonts.jetBrainsMono(fontSize: textSize),
        headlineMedium: GoogleFonts.jetBrainsMono(fontSize: textSize),
        headlineSmall: GoogleFonts.jetBrainsMono(fontSize: textSize),
        bodyLarge: GoogleFonts.jetBrainsMono(fontSize: textSize),
        bodyMedium: GoogleFonts.jetBrainsMono(fontSize: textSize),
        bodySmall: GoogleFonts.jetBrainsMono(fontSize: textSize),
        // Define other styles as needed
      ),
      // Define other theme properties if needed
    );
  }
}
