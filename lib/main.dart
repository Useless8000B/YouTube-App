import 'package:flutter/material.dart';
import 'package:youtube_app/colors.dart';
import 'package:youtube_app/screens/shell_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: AppColors.white,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColors.black
      ),
      home: const ShellScreen(),
    );
  }
}
