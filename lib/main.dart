import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'home_page.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aflah Shadil K - Flutter Developer',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
