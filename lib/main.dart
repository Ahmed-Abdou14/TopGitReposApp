import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const GitWizardApp());
}

class GitWizardApp extends StatelessWidget {
  const GitWizardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Git Wizard',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
