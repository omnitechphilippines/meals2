import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/tabs_page.dart';

final ThemeData theme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 131, 57, 0), brightness: Brightness.dark), textTheme: GoogleFonts.latoTextTheme());

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: theme, home: const TabsPage());
  }
}
