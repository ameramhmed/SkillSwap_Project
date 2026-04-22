import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/skill_provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => SkillProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final skillProvider = Provider.of<SkillProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillSwap',

      themeMode: skillProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const HomeScreen(),
    );
  }
}
