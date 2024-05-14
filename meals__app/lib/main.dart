import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals__app/data/dummy_data.dart';
import 'package:meals__app/screen/caterories.dart';
import 'package:meals__app/screen/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromRGBO(131, 57, 0, 1),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TabsScreen());
  }
}
