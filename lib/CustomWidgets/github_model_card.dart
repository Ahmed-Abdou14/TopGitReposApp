import 'package:flutter/material.dart';
import 'package:qcri_flutter_app/Repository/github_repo_model.dart';

class GitHubModelCard extends StatelessWidget {
  final GitHubRepoModel gitHubModel;

  const GitHubModelCard({
    Key? key,
    required this.gitHubModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              gitHubModel.repoName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              gitHubModel.repoUrl,
              style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.account_tree, size: 20, color: Colors.deepOrangeAccent),
                const SizedBox(width: 10),
                Text("${gitHubModel.forkCount}", style: const TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.star, size: 20, color: Colors.amber),
                const SizedBox(width: 10),
                Text("${gitHubModel.starCount}", style: const TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
      ),
    );
  }
}
