// ignore_for_file: curly_braces_in_flow_control_structures

import 'github_repo_model.dart';

class Repo {
  const Repo();

  Future<List<GitHubModel>> fetchTopRepos([count = 10]) async {
    // var response = await http
    //     .get(Uri.parse('http://10.0.2.2:8000/topRepos?repo_count=$count'));
    // var list = jsonDecode(response.body) as List<dynamic>;
    // return list.map((r) => GitHubRepo.fromJson(r)).toList();

    return Future.delayed(
      Duration(seconds: 1),
      () => [
        const GitHubModel(
          repoName: "AhmedQCRI",
          repoUrl: "127.0,0.1:8001",
          starCount: 12,
          forkCount: 20,
        ),
        const GitHubModel(
          repoName: "AhmedQCRI2",
          repoUrl: "127.0,0.1:8002",
          starCount: 120,
          forkCount: 200,
        ),
        const GitHubModel(
          repoName: "AhmedQCRI3",
          repoUrl: "127.0,0.1:8003",
          starCount: 1200,
          forkCount: 2000,
        ),
      ],
    );
  }
}
