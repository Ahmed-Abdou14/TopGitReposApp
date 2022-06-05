import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const GitWizardApp());
}

class GitWizardApp extends StatelessWidget {
  const GitWizardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Wizard',
      theme: ThemeData.dark(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
