class GitHubModel {
  final String repoName;
  final String repoUrl;
  final int starCount;
  final int forkCount;

  const GitHubModel({
    required this.repoName,
    required this.repoUrl,
    required this.starCount,
    required this.forkCount,
  });

  factory GitHubModel.fromJson(Map<String, dynamic> json) {
    return GitHubModel(
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
