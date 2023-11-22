import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toon/screens/home.dart';
import 'package:toon/screens/login.dart';
import 'package:toon/screens/login_screen.dart';
import 'package:toon/screens/tabs.dart';

final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 69, 74, 222),
    // background: const Color.fromARGB(255, 227, 234, 242)
    background: Colors.black);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  canvasColor: Color(0xff5e5b5a),
  textTheme: GoogleFonts.dmSansTextTheme().copyWith(
      titleLarge: GoogleFonts.dmSans(
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.dmSans(fontWeight: FontWeight.w500),
      titleSmall: GoogleFonts.dmSans(fontWeight: FontWeight.normal)),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toon',
      theme: theme,
      home: const TabsScreens(),
    );
  }
}
