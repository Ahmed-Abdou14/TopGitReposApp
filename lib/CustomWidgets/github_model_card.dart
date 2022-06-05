import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qcri_flutter_app/Repository/github_repo_model.dart';

class GitHubModelCard extends StatelessWidget {
  final GitHubModel gitHubModel;

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
              ),
            ),
            Text(
              gitHubModel.repoUrl,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.account_tree, size: 20, color: Colors.teal),
                Text("${gitHubModel.forkCount}"),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.star, size: 20, color: Colors.amber),
                Text("${gitHubModel.starCount}"),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
      ),
    );
  }
}
