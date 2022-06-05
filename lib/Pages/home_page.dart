import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qcri_flutter_app/CustomWidgets/github_model_card.dart';
import 'package:qcri_flutter_app/Repository/github_repo_model.dart';
import 'package:qcri_flutter_app/Repository/repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repo repo = const Repo();
  late List<GitHubModel> githubModels;
  late Future<List<GitHubModel>> githubModelsFuture;

  bool isActive = false;

  @override
  void initState() {
    super.initState();
    githubModels = [];
    githubModelsFuture = repo.fetchTopRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Git Wizard"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isActive = !isActive;
              });
            },
            icon: isActive ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.remove_red_eye),
          )
        ],
      ),
      body: Center(
        child: isActive
            ? Column(
                children: <Widget>[
                  FutureBuilder(
                    future: githubModelsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasData) {
                        githubModels = snapshot.data as List<GitHubModel>;
                        return ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GitHubModelCard(gitHubModel: githubModels[index]),
                          ),
                          itemCount: githubModels.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              )
            : Text("Explore the latest hot GitHub Repos now!"),
      ),
      floatingActionButton: isActive
          ? FloatingActionButton(
              onPressed: onRefreshPressed,
              tooltip: 'Refresh',
              child: const Icon(Icons.refresh),
            )
          : null,
    );
  }

  void onRefreshPressed() {
    setState(() {
      githubModelsFuture = repo.fetchTopRepos();
    });
  }
}
