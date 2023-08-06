import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:resumup/routes/app_routes.dart';
import 'package:window_location_href/window_location_href.dart';

class ResumeBuildController extends GetxController {
  late Client client;
  late Account account;
  var currentStep = 1.obs;
  var Vercel_isPressed = false.obs;
  var initialization = false.obs;
  var sending = false.obs;
  var commits = 0;
  var totalCount;
  var profile_isPressed = false.obs;
  var github_issues_isPressed = false.obs;
  var github_chart_isPressed = false.obs;
  late Session session;
  var contridata;
  var status_deploy;
  var pr_issue_num;
  List PushEvents = [];
  final Map record_push = {};
  List CreateEvents = [];
  List PushRepos = [];
  List CreateRepos = [];
  Map<DateTime, int> impressions = {};
  var auth_token;
  var push_repo_names = [];
  var git_access_token;
  var UserInfo;
  var hasDeployed = false.obs;
  var linkToDeploy;
  var activity;
  var res_get;
  var profile_url;
  var EmailInfo;
  var settings;
  var dep_resp;
  var pr_issue;
  var projects;
  var headers;
  var headers_projects;
  var map;
  var headers_proxy = {'Content-Type': 'application/json'};
  final Uri? location = href == null ? null : Uri.parse(href!);
  TextEditingController auth_token_feild_controller = TextEditingController();
  TextEditingController name_feild = TextEditingController();
  TextEditingController description_feild = TextEditingController();
  TextEditingController email_feild = TextEditingController();
  TextEditingController github_unme_feild = TextEditingController();
  TextEditingController twitter_unme = TextEditingController();
  TextEditingController linkedIn_unme = TextEditingController();

  void setstatus() {
    map = {
      "widgets": {
        "base_info": {
          "name": name_feild.text,
          "description": description_feild.text
        },
        "avatar": profile_isPressed.value ? {"url": profile_url} : null,
        "github_activity": github_issues_isPressed.value ? {} : null,
        "vercel": Vercel_isPressed.value ? {} : null,
        "contactme": {
          "email_address": email_feild.text,
          "github_username": github_unme_feild.text,
          "twitter_username": twitter_unme.text,
          "linkedin_username": linkedIn_unme.text,
        },
        "github_chart": github_chart_isPressed.value ? {} : null,
      },
      "connections": {
        "github_access_token": git_access_token,
        "vercel_auth_token": auth_token
      }
    };
    print(map);
  }

  // onInit()
  @override
  void onInit() async {
    client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('64bda5974a3168ff237a')
        .setSelfSigned(status: true);
    account = Account(client);
    super.onInit();
  }
  // ----------------------------------

  Future<void> putToken() async {
    var request_put = http.Request(
        'POST', Uri.parse('https://resumeup-server.onrender.com/putToken'));
    request_put.headers.addAll(headers_proxy);
    request_put.body =
        json.encode({"Uid": session.userId, "VercelToken": auth_token});

    http.StreamedResponse response = await request_put.send();
    print("Put Token Sent");

    if (response.statusCode == 200) {
      print("Put Token Success");

      headers_projects = {'Authorization': 'Bearer ${auth_token}'};

      var request_projects =
          http.Request('GET', Uri.parse('https://api.vercel.com/v9/projects'));
      request_projects.headers.addAll(headers_projects);

      http.StreamedResponse response_projects = await request_projects.send();

      if (response_projects.statusCode == 200) {
        projects = await response_projects.stream.bytesToString();
        projects = jsonDecode(projects);
        projects = projects["projects"];
        Get.toNamed(AppRoutes.profileBuild);
      } else {
        print(response_projects.reasonPhrase);
      }
    } else {
      print("Put Token Failed");
      print(response.reasonPhrase);
    }
  }

  Future<void> checkStep() async {
    initialization.value = true;
    try {
      session = await account.getSession(
        sessionId: 'current',
      );
    } catch (err) {
      initialization.value = false;
      currentStep.value = 1;
      print("U need to Sign In");
      return;
    }

    if (session.current) {
      git_access_token = session.providerAccessToken;
      print(git_access_token);
      currentStep.value = 2;

      var request_get_status = http.Request(
          'POST', Uri.parse('https://resumeup-server.onrender.com/getStatus'));

      request_get_status.body = json.encode({"Uid": session.userId});

      request_get_status.headers.addAll(headers_proxy);

      http.StreamedResponse response_get_status =
          await request_get_status.send();
      print("Sent check deployed");

      if (response_get_status.statusCode == 200) {
        hasDeployed.value = true;
        initialization.value = false;
      } else {
        var request_get = http.Request(
            'POST', Uri.parse('https://resumeup-server.onrender.com/getToken'));
        request_get.body = json.encode({"Uid": session.userId});
        request_get.headers.addAll(headers_proxy);

        http.StreamedResponse response_get = await request_get.send();
        print("Get Token Sent");

        if (response_get.statusCode == 200) {
          Get.offNamed(AppRoutes.profileBuild);
          initialization.value = false;

          res_get = await response_get.stream.bytesToString();
          res_get = jsonDecode(res_get);
          auth_token = res_get['VercelToken'];
          headers_projects = {'Authorization': 'Bearer ${auth_token}'};

          var request_projects = http.Request(
              'GET', Uri.parse('https://api.vercel.com/v9/projects'));

          request_projects.headers.addAll(headers_projects);

          http.StreamedResponse response_projects =
              await request_projects.send();

          print("Getting vercel deploys");

          if (response_projects.statusCode == 200) {
            print("Got projects");
            projects = await response_projects.stream.bytesToString();
            projects = jsonDecode(projects);
            projects = projects["projects"];
          } else {
            print("Could not get projects");
            print(response_projects.reasonPhrase);
          }
        } else {
          initialization.value = false;
          print("You need to give us the Token");
        }

        headers = {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer ${git_access_token}',
          'X-GitHub-Api-Version': '2022-11-28'
        };

        var request =
            http.Request('GET', Uri.parse('https://api.github.com/user'));
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print("Got User");
          UserInfo = await response.stream.bytesToString();
          UserInfo = jsonDecode(UserInfo);

          profile_url = UserInfo['avatar_url'].toString();
          name_feild.text = UserInfo['name'];
          github_unme_feild.text = UserInfo['login'];
          description_feild.text = UserInfo['bio'];
        } else {
          print("Did not get user");
          print(response.reasonPhrase);
        }
        var request_email = http.Request(
            'GET', Uri.parse('https://api.github.com/user/emails'));
        request_email.headers.addAll(headers);

        http.StreamedResponse response_emails = await request_email.send();

        if (response_emails.statusCode == 200) {
          EmailInfo = await response_emails.stream.bytesToString();
          EmailInfo = jsonDecode(EmailInfo);
          email_feild.text = EmailInfo[0]["email"];
        } else {
          print(response_emails.reasonPhrase);
        }
        await getGithubActivity();
        print("Got Activity");
        await getGithubMap();
        print("Got Maps");
      }
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

  Future<void> getGithubMap() async {
    var headers = {
      'Authorization': 'bearer ${session.providerAccessToken}',
      'Content-Type': 'text/plain'
    };
    var request =
        http.Request('POST', Uri.parse('https://api.github.com/graphql'));
    request.body =
        '''{"query":"query {\\n  user(login: \\"${UserInfo['login']}\\") {\\n    name\\n    contributionsCollection {\\n      contributionCalendar {\\n        colors\\n        totalContributions\\n        weeks {\\n          contributionDays {\\n            color\\n            contributionCount\\n            date\\n            weekday\\n          }\\n          firstDay\\n        }\\n      }\\n    }\\n  }\\n}"}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      contridata = await response.stream.bytesToString();
      contridata = jsonDecode(contridata);
      contridata = contridata["data"]["user"]["contributionsCollection"]
          ["contributionCalendar"];
      totalCount = contridata["totalContributions"];
      contridata = contridata["weeks"];
      for (int i = 0; i < contridata.length; i++) {
        for (int j = 0; j < contridata[i]["contributionDays"].length; j++) {
          if (contridata[i]["contributionDays"][j]["contributionCount"] != 0) {
            impressions[DateTime.parse(
                    contridata[i]["contributionDays"][j]["date"])] =
                contridata[i]["contributionDays"][j]["contributionCount"];
          }
        }
      }
      print("flag check");
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> deployIt() async {
    var request_deploy = http.Request(
        'POST', Uri.parse('https://resumeup-server.onrender.com/deploy'));
    request_deploy.headers.addAll(headers_proxy);
    request_deploy.body = json.encode(map);
    http.StreamedResponse response_deploy = await request_deploy.send();
    print("Deploying");
    if (response_deploy.statusCode == 200) {
      print("Deployed");
      dep_resp = await response_deploy.stream.bytesToString();
      dep_resp = jsonDecode(dep_resp);
      status_deploy = dep_resp["status"];
      linkToDeploy = dep_resp["link"];
    } else {
      print("Could not Deploy");
      print(response_deploy.reasonPhrase);
    }
  }

  Future<void> storedeploystatus() async {
    var request_put = http.Request(
        'POST', Uri.parse('https://resumeup-server.onrender.com/setStatus'));
    request_put.headers.addAll(headers_proxy);
    request_put.body = json.encode({"Uid": session.userId, "Status": "true"});
    http.StreamedResponse response_set = await request_put.send();
    print("setting status");
    if (response_set.statusCode == 200) {
      print("status set");
    } else {
      print("status not set");
    }
    print("Hello");
  }

  Future<void> gitSignIn() async {
    await account.createOAuth2Session(
      provider: 'github',
      scopes: ["public_repo"],
      success: kIsWeb ? '${location?.origin}/auth.html' : null,
    );
    await checkStep();
  }
}
