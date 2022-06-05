// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'github_repo_model.dart';

class Repo {
  const Repo();

  Future<List<GitHubRepo>> fetchTopRepos([count = 10]) async {
    var response = await http
        .get(Uri.parse('http://10.0.2.2:8000/topRepos?repo_count=$count'));
    var list = jsonDecode(response.body) as List<dynamic>;
    return list.map((r) => GitHubRepo.fromJson(r)).toList();
  }
}
