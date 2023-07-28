import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:resumup/routes/app_routes.dart';
import 'package:window_location_href/window_location_href.dart';

class ResumeBuildController extends GetxController {
  late Client client;
  var currentStep = 1.obs;
  var Vercel_isPressed = false.obs;
  var commits = 0;
  var profile_isPressed = false.obs;
  var github_issues_isPressed = false.obs;
  var github_chart_isPressed = false.obs;
  late Session session;
  var pr_issue_num;
  List PushEvents = [];
  final Map record_push = {};
  List CreateEvents = [];
  List PushRepos = [];
  List CreateRepos = [];
  var auth_token;
  var push_repo_names = [];
  var git_access_token;
  var UserInfo;
  var activity;
  var res_get;
  var profile_url;
  var EmailInfo;
  var settings;
  var pr_issue;
  var projects;
  var headers;
  var headers_projects;
  TextEditingController auth_token_feild_controller = TextEditingController();
  TextEditingController name_feild = TextEditingController();
  TextEditingController description_feild = TextEditingController();
  TextEditingController email_feild = TextEditingController();
  TextEditingController github_unme_feild = TextEditingController();
  TextEditingController twitter_unme = TextEditingController();
  TextEditingController linkedIn_unme = TextEditingController();
  var map;
  void setstatus() {
    map = {
      "widgets": [
        {
          "name": "base_info",
          "data": {
            "name": name_feild.text,
            "description": description_feild.text
          }
        },
        profile_isPressed.value
            ? {
                "name": "avatar",
                "data": {"url": profile_url}
              }
            : null,
        github_issues_isPressed.value ? {"name": "issues", "data": {}} : null,
        github_chart_isPressed.value ? {"name": "chart", "data": {}} : null,
        {
          "name": "contactme",
          "data": {
            "email": email_feild.text,
            "github_unme": github_unme_feild.text,
            "twitter_unme": twitter_unme.text,
            "linkedIn_unme": linkedIn_unme.text,
          }
        },
        Vercel_isPressed.value ? {"name": "vercel", "data": {}} : null,
      ],
      "connections": {
        "github_access_token": git_access_token,
        "vercel_auth_token": auth_token
      }
    };
  }

  final Uri? location = href == null ? null : Uri.parse(href!);
  late Account account;
  @override
  void onInit() async {
    client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('64bda5974a3168ff237a')
        .setSelfSigned(status: true);
    account = Account(client);
    super.onInit();
    await checkStep();
  }

  Future<void> putToken() async {
    var headers_put = {'Content-Type': 'application/json'};
    var request_put = http.Request(
        'POST', Uri.parse('https://resumeup-server.onrender.com/putToken'));
    print(auth_token);
    request_put.headers.addAll(headers_put);
    request_put.body =
        json.encode({"Uid": session.userId, "VercelToken": auth_token});

    http.StreamedResponse response = await request_put.send();
    print("Hello");

    if (response.statusCode == 200) {
      print("i ran");

      headers_projects = {'Authorization': 'Bearer ${auth_token}'};

      var request_projects =
          http.Request('GET', Uri.parse('https://api.vercel.com/v9/projects'));
      request_projects.headers.addAll(headers_projects);

      http.StreamedResponse response_projects = await request_projects.send();

      if (response_projects.statusCode == 200) {
        projects = await response_projects.stream.bytesToString();
        projects = jsonDecode(projects);
        projects = projects["projects"];
        print(projects);
        Get.toNamed(AppRoutes.profileBuild);
      } else {
        print(response_projects.reasonPhrase);
      }
    } else {
      print("i fail");
      print(response.reasonPhrase);
    }
  }

  Future<void> checkStep() async {
    session = await account.getSession(
      sessionId: 'current',
    );
    if (session.current == true) {
      currentStep.value = 2;
      print(session.providerAccessToken);

      var request_get = http.Request(
          'POST', Uri.parse('https://resumeup-server.onrender.com/getToken'));
      request_get.body = json.encode({"Uid": session.userId});

      var headers_get = {'Content-Type': 'application/json'};
      request_get.headers.addAll(headers_get);

      http.StreamedResponse response_get = await request_get.send();
      print("hello");

      if (response_get.statusCode == 200) {
        print("hi");

        res_get = await response_get.stream.bytesToString();
        res_get = jsonDecode(res_get);
        auth_token = res_get['VercelToken'];
        headers_projects = {'Authorization': 'Bearer ${auth_token}'};

        var request_projects = http.Request(
            'GET', Uri.parse('https://api.vercel.com/v9/projects'));
        request_projects.headers.addAll(headers_projects);

        http.StreamedResponse response_projects = await request_projects.send();

        if (response_projects.statusCode == 200) {
          projects = await response_projects.stream.bytesToString();
          projects = jsonDecode(projects);
          projects = projects["projects"];
          print(projects);
          print("Hoya");
        } else {
          print(response_projects.reasonPhrase);
        }

        Get.offNamed(AppRoutes.profileBuild);
      } else {
        print(response_get.reasonPhrase);
      }

      headers = {
        'Accept': 'application/vnd.github+json',
        'Authorization': 'Bearer ${session.providerAccessToken}',
        'X-GitHub-Api-Version': '2022-11-28'
      };

      var request =
          http.Request('GET', Uri.parse('https://api.github.com/user'));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        UserInfo = await response.stream.bytesToString();
        UserInfo = jsonDecode(UserInfo);

        profile_url = UserInfo['avatar_url'].toString();
        name_feild.text = UserInfo['name'];
        github_unme_feild.text = UserInfo['login'];
        description_feild.text = UserInfo['bio'];
      } else {
        print(response.reasonPhrase);
      }
      var request_email =
          http.Request('GET', Uri.parse('https://api.github.com/user/emails'));
      request_email.headers.addAll(headers);

      http.StreamedResponse response_emails = await request_email.send();

      if (response_emails.statusCode == 200) {
        EmailInfo = await response_emails.stream.bytesToString();
        EmailInfo = jsonDecode(EmailInfo);
        email_feild.text = EmailInfo[0]["email"];
      } else {
        print(response_emails.reasonPhrase);
      }

      getGithubActivity();
    }
  }

  Future<void> getGithubActivity() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.github.com/users/${UserInfo['login']}/events?q=per_page:100'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      activity = await response.stream.bytesToString();
      activity = jsonDecode(activity);

      for (var i = 0; i < activity.length; i++) {
        if (activity[i]['type'] == "PushEvent") {
          PushRepos.add({
            activity[i]['repo']['name']:
                activity[i]['payload']['commits'].length
          });
          PushEvents.add(activity[i]);
          push_repo_names.add(activity[i]['repo']['name']);
        } else if (activity[i]['type'] == "CreateEvent") {
          CreateEvents.add(activity[i]);
          CreateRepos.add(activity[i]['repo']['name']);
        }
      }
      print("Hey there");
      push_repo_names = push_repo_names.toSet().toList();
      for (int l = 0; l < PushRepos.length; l++) {
        var key = PushRepos[l].keys.toList();
        key = key[0];
        record_push.containsKey(key)
            ? record_push[key] += PushRepos[l][key]
            : record_push[key] = PushRepos[l][key];
      }
      record_push.keys.forEach((k) {
        commits += record_push[k] as int;
      });
      CreateRepos = CreateRepos.toSet().toList();
      var request_pr_issue = http.Request(
          'GET',
          Uri.parse(
              'https://api.github.com/search/issues?q=author:Aarush-Acharya&type:issue&state:open&is:open'));

      request_pr_issue.headers.addAll(headers);

      http.StreamedResponse response_pr_issue = await request_pr_issue.send();

      if (response_pr_issue.statusCode == 200) {
        pr_issue = await response_pr_issue.stream.bytesToString();
        pr_issue = jsonDecode(pr_issue);
        pr_issue_num = pr_issue["total_count"];
      } else {
        print(response_pr_issue.reasonPhrase);
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> gitSignIn() async {
    await account.createOAuth2Session(
      provider: 'github',
      success: kIsWeb ? '${location?.origin}/auth.html' : null,
    );
    await checkStep();
  }
}
