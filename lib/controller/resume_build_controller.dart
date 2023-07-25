import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_location_href/window_location_href.dart';

class ResumeBuildController extends GetxController {
  late Client client;
  var currentStep = 1.obs;
  var Vercel_isPressed = false.obs;
  var profile_isPressed = false.obs;
  var github_issues_isPressed = false.obs;
  var github_chart_isPressed = false.obs;
  var auth_token;
  TextEditingController auth_token_feild_controller = TextEditingController();
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

  Future<void> checkStep() async {
    await account
        .getSession(
      sessionId: 'current',
    )
        .then((result) {
      if (result.current == true) {
        currentStep.value = 2;
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
