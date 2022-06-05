class GitHubRepoModel {
  final String repoName;
  final String repoUrl;
  final int starCount;
  final int forkCount;

  const GitHubRepoModel ({
    required this.repoName,
    required this.repoUrl,
    required this.starCount,
    required this.forkCount,
  });

  factory GitHubRepoModel.fromJson(Map<String, dynamic> json) {
    return GitHubRepoModel (
        repoName: json["repo_name"],
        repoUrl: json["repo_url"],
        starCount: json["star_count"],
        forkCount: json["forks_count"]);
  }

  @override
  String toString() {
    return '$repoName-$repoUrl-$starCount';
  }
}
