// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resumup/controller/resume_build_controller.dart';
import 'package:resumup/resume.dart';
import 'package:resumup/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bindings/resume_build_bindings.dart';
import 'home_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    getPages: AppPages.pages,
    initialBinding: Resume_Build_Bindings(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: HomeScreen(),
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.find<ResumeBuildController>();


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          1.38 / 100 * MediaQuery.of(context).size.width,
                      vertical:
                          2.43 / 100 * MediaQuery.of(context).size.height),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      width: 20.83 / 100 * MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(207, 216, 134, 11),
                        Color.fromARGB(211, 245, 181, 116)
                      ])),
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.69 /
                                  100 *
                                  MediaQuery.of(context).size.width,
                              vertical: 1.21 /
                                  100 *
                                  MediaQuery.of(context).size.height),
                          child: Obx(
                            () => Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 0.6 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                ),
                                Card(
                                  color: Colors.black,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 3.65 /
                                        100 *
                                        MediaQuery.of(context).size.height,
                                    child: Center(
                                        child: Text(
                                      "Pick your Widgets",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.21 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                ),
                                Divider(
                                  indent: 1.041 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  endIndent: 1.041 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  thickness: 0.24 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                ),
                                SizedBox(
                                  height: 1.21 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 27.04 /
                                          100 *
                                          MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: controller
                                                        .Vercel_isPressed.value
                                                    ? Color.fromARGB(
                                                        57, 249, 245, 245)
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Card(
                                              child: InkWell(
                                                highlightColor: Color.fromARGB(
                                                    206, 235, 145, 81),
                                                splashColor: Color.fromRGBO(
                                                    244, 93, 7, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                onTap: () {
                                                  controller.Vercel_isPressed
                                                          .value =
                                                      !controller
                                                          .Vercel_isPressed
                                                          .value;
                                                },
                                                child: SizedBox(
                                                    height: 11.57 /
                                                        100 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 6.94 /
                                                        100 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Center(
                                                        child: Text(
                                                      'Vercel',
                                                      style: TextStyle(
                                                          fontSize: 1.33 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height),
                                                    ))),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.97 /
                                                100 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                          ),
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            color: controller
                                                    .profile_isPressed.value
                                                ? Color.fromARGB(
                                                    57, 249, 245, 245)
                                                : Colors.transparent,
                                            child: InkWell(
                                              highlightColor: Color.fromARGB(
                                                  206, 235, 145, 81),
                                              splashColor: Color.fromARGB(
                                                  212, 230, 98, 22),
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                              onTap: () {
                                                controller.profile_isPressed
                                                        .value =
                                                    !controller
                                                        .profile_isPressed
                                                        .value;
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0.3 /
                                                        100 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    horizontal: 0.347 /
                                                        100 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70),
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Color.fromARGB(255,
                                                                237, 20, 92),
                                                            Color.fromARGB(255,
                                                                235, 66, 122)
                                                          ])),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.347 /
                                                                100 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            vertical: 0.6 /
                                                                100 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              170, 150, 3, 163),
                                                      radius: 2.74 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height +
                                                          1.5 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                      child: SizedBox(
                                                          height: 11.57 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height,
                                                          width: 6.94 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                          child: Center(
                                                              child: Text(
                                                            "Image Icon",
                                                            style: TextStyle(
                                                                fontSize: 1.46 /
                                                                    100 *
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height,
                                                                color: Colors
                                                                    .white),
                                                          ))),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: 0.69 /
                                            100 *
                                            MediaQuery.of(context).size.width),
                                    Material(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: controller
                                              .github_issues_isPressed.value
                                          ? Color.fromARGB(57, 249, 245, 245)
                                          : Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        highlightColor:
                                            Color.fromARGB(206, 235, 145, 81),
                                        splashColor:
                                            Color.fromRGBO(244, 93, 7, 1),
                                        onTap: () {
                                          controller.github_issues_isPressed
                                                  .value =
                                              !controller
                                                  .github_issues_isPressed
                                                  .value;
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.41 /
                                                  100 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              vertical: 0.73 /
                                                  100 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color.fromARGB(
                                                          255, 68, 199, 72),
                                                      Color.fromARGB(
                                                          255, 17, 135, 21)
                                                    ])),
                                            child: SizedBox(
                                                height: 25.57 /
                                                    100 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 9.72 /
                                                    100 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: Center(
                                                  child: Text(
                                                    "Github Activity",
                                                    style: TextStyle(
                                                        fontSize: 1.67 /
                                                            100 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 6.09 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                ),
                                Material(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: controller.github_chart_isPressed.value
                                      ? Color.fromARGB(57, 249, 245, 245)
                                      : Colors.transparent,
                                  child: InkWell(
                                    highlightColor:
                                        Color.fromARGB(206, 235, 145, 81),
                                    splashColor: Color.fromRGBO(244, 93, 7, 1),
                                    onTap: () {
                                      controller.github_chart_isPressed.value =
                                          !controller
                                              .github_chart_isPressed.value;
                                    },
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.55 /
                                              100 *
                                              MediaQuery.of(context).size.width,
                                          vertical: 0.97 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: const [
                                                  Color.fromARGB(
                                                      255, 57, 158, 60),
                                                  Color.fromARGB(
                                                      255, 12, 91, 15)
                                                ])),
                                        height: 17.05 /
                                            100 *
                                            MediaQuery.of(context).size.height,
                                        width: 18.75 /
                                            100 *
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                          child: Text(
                                            'GitHub Chart',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 2.43 / 100 * MediaQuery.of(context).size.height),
                child: SizedBox(
                  width: 75.4 / 100 * MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Portfolio Preview",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Nunito',
                                    fontSize: 2.43 /
                                        100 *
                                        MediaQuery.of(context).size.height,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w100)),
                            Row(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(56, 228, 228, 228),
                                      child: Center(
                                        child: Icon(
                                          Icons.wb_sunny_outlined,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () async {
                                    await controller.account
                                        .deleteSession(sessionId: 'current');
                                    Get.offNamed('/');
                                  },
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(56, 228, 228, 228),
                                      child: Center(
                                        child: Icon(
                                          Icons.logout_rounded,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  highlightColor: Colors.orange,
                                  splashColor: Colors.amber,
                                  onTap: () async {
                                    controller.setstatus();
                                    controller.sending.value = true;
                                    await controller.deployIt();
                                    if (controller.status_deploy) {
                                      controller.storedeploystatus();
                                      // ignore: use_build_context_synchronously
                                      showDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (_) => AlertDialog(
                                                elevation: 20,
                                                title: Text(
                                                  "Congratulations 🎉🎉",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          190, 183, 178, 178)),
                                                ),
                                                backgroundColor: Colors.black,
                                                content: SingleChildScrollView(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Your Portfolio has been deployed visit ',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    189,
                                                                    131,
                                                                    125,
                                                                    125)),
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            launchUrl(Uri.parse(
                                                                controller
                                                                    .linkToDeploy));
                                                          },
                                                          child: Icon(
                                                            EvaIcons.globe,
                                                            color: Colors.white,
                                                          )),
                                                      Text(
                                                        " Also please check you github repos to find your protfolio repo or ",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    189,
                                                                    131,
                                                                    125,
                                                                    125)),
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            launchUrl(Uri.parse(
                                                                'https://github.com/${controller.UserInfo['login']}/${controller.dep_resp['repo_name']}'));
                                                          },
                                                          child: Text(
                                                              "visit it ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue))),
                                                      Text(
                                                        "And look for the Deployment in your Vercel Dashboard",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    189,
                                                                    131,
                                                                    125,
                                                                    125)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ));
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      showDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (_) => AlertDialog(
                                                elevation: 20,
                                                title: Text(
                                                  "Apologies Some Error Occured 🙁",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          190, 183, 178, 178)),
                                                ),
                                                backgroundColor: Colors.black,
                                                content: SingleChildScrollView(
                                                  child: Text(
                                                    'Your Portfolio could not be deployed',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            189,
                                                            131,
                                                            125,
                                                            125)),
                                                  ),
                                                ),
                                              ));
                                    }
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(255, 213, 134, 15),
                                          Color.fromARGB(255, 225, 158, 58)
                                        ])),
                                    child: SizedBox(
                                      height: 3.65 /
                                          100 *
                                          MediaQuery.of(context).size.height,
                                      width: 5.55 /
                                          100 *
                                          MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Text(
                                          "Deploy",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height:
                              1.827 / 100 * MediaQuery.of(context).size.height,
                        ),
                        DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            dashPattern: [6, 3, 6, 3],
                            color: Colors.amber,
                            padding: EdgeInsets.symmetric(
                                vertical: 0.73 /
                                    100 *
                                    MediaQuery.of(context).size.height,
                                horizontal: 0.4166 /
                                    100 *
                                    MediaQuery.of(context).size.width),
                            child: Resume())
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        controller.sending.value
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Center(
                    child: LoadingAnimationWidget.threeRotatingDots(
                        color: Colors.orange, size: Get.pixelRatio * 20)),
              )
            : SizedBox(),
      ]),
    );
  }
}
