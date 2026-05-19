import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_screen.dart';

void mainCommon({bool showDebugBanner = false, String titleSuffix = ''}) {
  runApp(MyApp(showDebugBanner: showDebugBanner, titleSuffix: titleSuffix));
}

class MyApp extends StatelessWidget {
  final bool showDebugBanner;
  final String titleSuffix;

  const MyApp({super.key, this.showDebugBanner = false, this.titleSuffix = ''});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieMate$titleSuffix',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
