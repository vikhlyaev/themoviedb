import 'package:flutter/material.dart';
import 'package:themoviedb/auth/auth_widget.dart';
import 'package:themoviedb/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie DB',
      home: AuthWidget(),
      theme: AppTheme().dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
