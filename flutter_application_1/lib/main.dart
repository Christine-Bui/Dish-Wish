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
      cardColor: brightness == Brightness.light
          ? Colors.white
          : const Color.fromRGBO(50, 50, 50, 1),
      // Define the default font family.
      textTheme: TextTheme(
        titleLarge: GoogleFonts.jetBrainsMono(
            fontSize: textSize + 4, fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.jetBrainsMono(
            fontSize: textSize - 2, fontWeight: FontWeight.w700),
        titleSmall: GoogleFonts.jetBrainsMono(
            fontSize: textSize - 4, fontWeight: FontWeight.w700),
        headlineLarge: GoogleFonts.jetBrainsMono(
            fontSize: textSize, fontWeight: FontWeight.w600),
        headlineMedium: GoogleFonts.jetBrainsMono(
            fontSize: textSize - 2, fontWeight: FontWeight.w600),
        headlineSmall: GoogleFonts.jetBrainsMono(
            fontSize: textSize - 3, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.jetBrainsMono(
            fontSize: textSize, fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.jetBrainsMono(
            fontSize: textSize - 2, fontWeight: FontWeight.w500),
        bodySmall: GoogleFonts.jetBrainsMono(
            fontSize: textSize - 4, fontWeight: FontWeight.w400),
        // Define other styles as needed
      ),
      // Define other theme properties if needed
    );
  }
}
