import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:window_location_href/window_location_href.dart';

class ResumeBuildController extends GetxController {
  late Client client;
  var currentStep = 1.obs;
  var Vercel_isPressed = false.obs;
  var profile_isPressed = false.obs;
  var github_issues_isPressed = false.obs;
  var github_chart_isPressed = false.obs;
  var auth_token;
  var git_access_token;
  var UserInfo;
  var profile_url;
  var EmailInfo;
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
    // var settings = new ConnectionSettings(
    //     host: 'gateway01.eu-central-1.prod.aws.tidbcloud.com',
    //     port: 4000,
    //     user: 'Pd5yfUT23Tzbine.root',
    //     password: '8fIdoyXs7zyI7bjL',
    //     db: 'ResumeUp');
    // conn = await MySqlConnection.connect(settings);
    super.onInit();
    await checkStep();
  }

  Future<void> checkStep() async {
    await account
        .getSession(
      sessionId: 'current',
    )
        .then((result) async {
      if (result.current == true) {
        currentStep.value = 2;
        // auth_token = await conn.query(
        //     'select VercelAuthToken from VercelAuthTokens where Uid = ?', [
        //   result.userId
        // ]).then(navigatorKey.currentState!.pushNamed('/potfolioBuild')).catchError((e) => print(e));

        print(result.providerAccessToken);
        var headers = {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer ${result.providerAccessToken}',
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
      }
    });
  }

  Future<void> gitSignIn() async {
    await account.createOAuth2Session(
      provider: 'github',
      success: kIsWeb ? '${location?.origin}/auth.html' : null,
    );
    await checkStep();
  }
}
