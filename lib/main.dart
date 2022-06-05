import 'package:flutter/material.dart';
import 'package:qcri_flutter_app/repo.dart';

import 'github_repo_model.dart';
import 'repo.dart';

var repo = const Repo();

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
      home: const HomePage(title: 'Git Wizard'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<GitHubRepo>> topRepos;

  void _displayCards() {}

  @override
  void initState() {
    super.initState();
    topRepos = repo.fetchTopRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: topRepos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayCards,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
