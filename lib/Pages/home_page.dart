import 'package:flutter/material.dart';
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
  late List<GitHubRepoModel> githubModels;
  late Future<List<GitHubRepoModel>> githubModelsFuture;
  bool isShowingCards = false;

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
        centerTitle: true,
        title: const Text("Git Wizard"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isShowingCards = !isShowingCards;
              });
            },
            icon: isShowingCards ? const Icon(Icons.remove_red_eye_outlined) : const Icon(Icons.remove_red_eye),
          )
        ],
      ),
      body: Center(
        child: isShowingCards
            ? Column(
                children: <Widget>[
                  FutureBuilder(
                    future: githubModelsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasData) {
                        githubModels = snapshot.data as List<GitHubRepoModel>;
                        return ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GitHubModelCard(gitHubModel: githubModels[index]),
                          ),
                          itemCount: githubModels.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              )
            : Column(
              children: [
                const SizedBox(height: 100),
                Image.asset('assets/Octocat.png'),
                const SizedBox(height: 50),
                const Text(
                  'Peak Github\'s Most Wanted Repos',
                  style: TextStyle(   
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ]
            ),
      ),
      floatingActionButton: isShowingCards
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
