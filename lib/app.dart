import 'package:flutter/material.dart';
import 'package:luitime/features/capsule/presentation/home_page.dart';
import 'package:luitime/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.amoled,
      home: const HomePage(),
    );
  }
}
