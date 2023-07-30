// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resumup/controller/resume_build_controller.dart';
import 'package:resumup/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
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
                      horizontal: 1.38 / 100 * MediaQuery.of(context).size.width,
                      vertical: 2.43 / 100 * MediaQuery.of(context).size.height),
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
                              horizontal: 0.69 / 100 * MediaQuery.of(context).size.width,
                              vertical: 1.21 / 100 * MediaQuery.of(context).size.height),
                          child: Obx(
                            () => Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 0.6 / 100 * MediaQuery.of(context).size.height,
                                ),
                                Card(
                                  color: Colors.black,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 3.65 / 100 * MediaQuery.of(context).size.height,
                                    child: Center(
                                        child: Text(
                                      "Pick your Widgets",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.21 / 100 * MediaQuery.of(context).size.height,
                                ),
                                Divider(
                                  indent: 1.041 / 100 * MediaQuery.of(context).size.width,
                                  endIndent: 1.041 / 100 * MediaQuery.of(context).size.width,
                                  thickness: 0.24 / 100 * MediaQuery.of(context).size.height,
                                ),
                                SizedBox(
                                  height: 1.21 / 100 * MediaQuery.of(context).size.height,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 27.04 / 100 * MediaQuery.of(context).size.height,
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
                                                        MediaQuery.of(context).size.height,
                                                    width:
                                                        6.94 / 100 * MediaQuery.of(context).size.width,
                                                    child: Center(
                                                        child: Text(
                                                      'Vercel',
                                                      style: TextStyle(
                                                          fontSize: 1.33 /
                                                              100 *
                                                              MediaQuery.of(context).size.height),
                                                    ))),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.97 / 100 * MediaQuery.of(context).size.height,
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
                                                    vertical:
                                                        0.3 / 100 * MediaQuery.of(context).size.height,
                                                    horizontal: 0.347 /
                                                        100 *
                                                        MediaQuery.of(context).size.width),
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
                                                                MediaQuery.of(context).size.width,
                                                            vertical: 0.6 /
                                                                100 *
                                                                MediaQuery.of(context).size.height),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              170, 150, 3, 163),
                                                      radius: 2.74 /
                                                              100 *
                                                              MediaQuery.of(context).size.height +
                                                          1.5 / 100 * MediaQuery.of(context).size.width,
                                                      child: SizedBox(
                                                          height: 11.57 /
                                                              100 *
                                                              MediaQuery.of(context).size.height,
                                                          width: 6.94 /
                                                              100 *
                                                              MediaQuery.of(context).size.width,
                                                          child: Center(
                                                              child: Text(
                                                            "Image Icon",
                                                            style: TextStyle(
                                                                fontSize: 1.46 /
                                                                    100 *
                                                                    MediaQuery.of(context).size.height,
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
                                    SizedBox(width: 0.69 / 100 * MediaQuery.of(context).size.width),
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
                                              horizontal:
                                                  0.41 / 100 * MediaQuery.of(context).size.width,
                                              vertical:
                                                  0.73 / 100 * MediaQuery.of(context).size.height),
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
                                                height:
                                                    25.57 / 100 * MediaQuery.of(context).size.height,
                                                width: 9.72 / 100 * MediaQuery.of(context).size.width,
                                                child: Center(
                                                  child: Text(
                                                    "Github Activity",
                                                    style: TextStyle(
                                                        fontSize: 1.67 /
                                                            100 *
                                                            MediaQuery.of(context).size.height,
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
                                  height: 6.09 / 100 * MediaQuery.of(context).size.height,
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
                                          horizontal: 0.55 / 100 * MediaQuery.of(context).size.width,
                                          vertical: 0.97 / 100 * MediaQuery.of(context).size.height),
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
                                        height: 17.05 / 100 * MediaQuery.of(context).size.height,
                                        width: 18.75 / 100 * MediaQuery.of(context).size.width,
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
                padding:
                    EdgeInsets.symmetric(vertical: 2.43 / 100 * MediaQuery.of(context).size.height),
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
                                    fontSize: 2.43 / 100 * MediaQuery.of(context).size.height,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w100)),
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
                                                        color: Color.fromARGB(
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
                                                        color: Color.fromARGB(
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
                                                      child: Text("visit it ",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blue))),
                                                  Text(
                                                    "And look for the Deployment in your Vercel Dashboard",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
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
                                                        189, 131, 125, 125)),
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
                                  height: 3.65 / 100 * MediaQuery.of(context).size.height,
                                  width: 5.55 / 100 * MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(
                                      "Deploy",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.827 / 100 * MediaQuery.of(context).size.height,
                        ),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          dashPattern: [6, 3, 6, 3],
                          color: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              vertical: 0.73 / 100 * MediaQuery.of(context).size.height,
                              horizontal: 0.4166 / 100 * MediaQuery.of(context).size.width),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              height: 87.2 / 100 * MediaQuery.of(context).size.height,
                              width: 76.388888 / 100 * MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.43 / 100 * MediaQuery.of(context).size.height,
                                    horizontal: 1.38 / 100 * MediaQuery.of(context).size.width),
                                child: Column(children: [
                                  SizedBox(
                                    height: 4.85 / 100 * MediaQuery.of(context).size.height,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 12.18 / 100 * MediaQuery.of(context).size.height,
                                      ),
                                      Obx(
                                        () => controller.profile_isPressed.value
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Color.fromARGB(255,
                                                              26, 153, 182),
                                                          Color.fromARGB(255,
                                                              81, 215, 245),
                                                        ])),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    radius: 2.36 /
                                                            100 *
                                                            MediaQuery.of(context).size.width +
                                                        4.14 / 100 * MediaQuery.of(context).size.height,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius
                                                          .circular(12.18 /
                                                                  100 *
                                                                  MediaQuery.of(context).size.height +
                                                              6.94 /
                                                                  100 *
                                                                  MediaQuery.of(context).size.width),
                                                      child: Image.network(
                                                          controller.profile_url
                                                              .toString()),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ),
                                      SizedBox(
                                        width: 1.38 / 100 * MediaQuery.of(context).size.width,
                                      ),
                                      Container(
                                        width: 34.72 / 100 * MediaQuery.of(context).size.width,
                                        height: 15.83 / 100 * MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                style: BorderStyle.solid,
                                                color: const Color.fromARGB(
                                                    151, 123, 121, 95)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    1.0416666 / 100 * MediaQuery.of(context).size.width,
                                                vertical:
                                                    1.218 / 100 * MediaQuery.of(context).size.height),
                                            child: Column(children: [
                                              TextField(
                                                controller:
                                                    controller.name_feild,
                                                style: TextStyle(
                                                    fontSize: 1.43 /
                                                            100 *
                                                            MediaQuery.of(context).size.height +
                                                        0.83 / 100 * MediaQuery.of(context).size.width,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "What's Your Name",
                                                    hintStyle: TextStyle(
                                                        fontSize: 1.43 /
                                                                100 *
                                                                MediaQuery.of(context).size.height +
                                                            0.83 /
                                                                100 *
                                                                MediaQuery.of(context).size.width,
                                                        color: Color.fromARGB(
                                                            146,
                                                            150,
                                                            137,
                                                            137)),
                                                    border: InputBorder.none),
                                                cursorOpacityAnimates: true,
                                                cursorWidth:
                                                    0.138 / 100 * MediaQuery.of(context).size.width,
                                                cursorHeight:
                                                    2.679 / 100 * MediaQuery.of(context).size.height,
                                                cursorRadius:
                                                    Radius.circular(20),
                                                cursorColor: Color.fromARGB(
                                                    0, 195, 187, 187),
                                              ),
                                              TextField(
                                                controller: controller
                                                    .description_feild,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize:
                                                        1.8 / 100 * MediaQuery.of(context).size.height,
                                                    color: Color.fromARGB(
                                                        171, 217, 213, 213)),
                                                decoration: InputDecoration(
                                                    hintText: "More about ya",
                                                    hintStyle: TextStyle(
                                                        fontSize: 1.8 /
                                                            100 *
                                                            MediaQuery.of(context).size.height,
                                                        color: Color.fromARGB(
                                                            109,
                                                            150,
                                                            137,
                                                            137)),
                                                    isDense: true,
                                                    border: InputBorder.none),
                                                cursorOpacityAnimates: true,
                                                cursorWidth:
                                                    0.138 / 100 * MediaQuery.of(context).size.width,
                                                cursorHeight:
                                                    1.948 / 100 * MediaQuery.of(context).size.height,
                                                cursorRadius:
                                                    Radius.circular(20),
                                                cursorColor: Color.fromARGB(
                                                    0, 195, 187, 187),
                                              ),
                                            ])),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.85 / 100 * MediaQuery.of(context).size.height,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 0.347 / 100 * MediaQuery.of(context).size.width,
                                      ),
                                      Obx(
                                        () => controller
                                                .github_issues_isPressed.value
                                            ? Container(
                                                height:
                                                    25.57 / 100 * MediaQuery.of(context).size.height,
                                                width: 22.22 / 100 * MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              151,
                                                              239,
                                                              11),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Color.fromARGB(
                                                              233, 87, 191, 27),
                                                          Color.fromARGB(255,
                                                              141, 211, 28),
                                                        ])),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0.694 /
                                                          100 *
                                                          MediaQuery.of(context).size.width,
                                                      vertical: 1.21 /
                                                          100 *
                                                          MediaQuery.of(context).size.height),
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text(
                                                            "Github Activity",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      //start
                                                      SizedBox(
                                                        height: 1.11 /
                                                            100 *
                                                            MediaQuery.of(context).size.height,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 0.76 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.width),
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          88,
                                                                          249,
                                                                          245,
                                                                          245),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    EvaIcons
                                                                        .upload_outline,
                                                                    size: 1.53 /
                                                                        100 *
                                                                        MediaQuery.of(context).size.height,
                                                                  )),
                                                              SizedBox(
                                                                width: 0.38 /
                                                                    100 *
                                                                    MediaQuery.of(context).size.width,
                                                              ),
                                                              Text(
                                                                  'Created ${controller.commits} commits in ${controller.record_push.length} Public ${(controller.record_push.length == 1) ? "Repo" : "Repos"}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                      fontSize: 1.67 /
                                                                          100 *
                                                                          MediaQuery.of(context).size.height)),
                                                            ],
                                                          )),
                                                      SizedBox(
                                                          height: 0.27 /
                                                              100 *
                                                              MediaQuery.of(context).size.height),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 3 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.height),
                                                          child: Container(
                                                            height: 4.17 /
                                                                100 *
                                                                MediaQuery.of(context).size.height,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  controller
                                                                      .record_push
                                                                      .length,
                                                              shrinkWrap: true,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Column(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Text(
                                                                          '- ${controller.push_repo_names[index]} (${controller.record_push[controller.push_repo_names[index]]})',
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(228, 244, 241, 241),
                                                                              fontFamily: 'Space',
                                                                              fontWeight: FontWeight.w200,
                                                                              fontSize: 1.4 / 100 * MediaQuery.of(context).size.height)),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 0.417 /
                                                                          100 *
                                                                          MediaQuery.of(context).size.height,
                                                                    )
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height: 1.67 /
                                                            100 *
                                                            MediaQuery.of(context).size.height,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 0.76 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.width),
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          88,
                                                                          249,
                                                                          245,
                                                                          245),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    EvaIcons
                                                                        .book_outline,
                                                                    size: 1.53 /
                                                                        100 *
                                                                        MediaQuery.of(context).size.height,
                                                                  )),
                                                              SizedBox(
                                                                width: 0.38 /
                                                                    100 *
                                                                    MediaQuery.of(context).size.width,
                                                              ),
                                                              Text(
                                                                  'Created ${controller.CreateRepos.length} new Public ${(controller.CreateRepos.length == 1) ? "Repo" : "Repos"}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                      fontSize: 1.67 /
                                                                          100 *
                                                                          MediaQuery.of(context).size.height)),
                                                            ],
                                                          )),
                                                      SizedBox(
                                                          height: 0.27 /
                                                              100 *
                                                              MediaQuery.of(context).size.height),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 3.065 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.width),
                                                          child: Container(
                                                            height: 3.48 /
                                                                100 *
                                                                MediaQuery.of(context).size.height,
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  controller
                                                                      .CreateRepos
                                                                      .length,
                                                              shrinkWrap: true,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Column(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Text(
                                                                          '- ${controller.CreateRepos[index]}',
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(228, 244, 241, 241),
                                                                              fontFamily: 'Space',
                                                                              fontWeight: FontWeight.w200,
                                                                              fontSize: 1.39 / 100 * MediaQuery.of(context).size.height)),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 0.417 /
                                                                          100 *
                                                                          MediaQuery.of(context).size.height,
                                                                    )
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 0.76 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.width),
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          88,
                                                                          249,
                                                                          245,
                                                                          245),
                                                                  radius: 10,
                                                                  child: Icon(
                                                                    Icons
                                                                        .merge_outlined,
                                                                    size: 1.53 /
                                                                        100 *
                                                                        MediaQuery.of(context).size.height,
                                                                  )),
                                                              SizedBox(
                                                                width: 0.38 /
                                                                    100 *
                                                                    MediaQuery.of(context).size.width,
                                                              ),
                                                              Text(
                                                                  'Interacted with ${controller.pr_issue_num} Issues/PRs',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                      fontSize: 1.67 /
                                                                          100 *
                                                                          MediaQuery.of(context).size.height)),
                                                            ],
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ),
                                      SizedBox(
                                        width: 2.083 / 100 * MediaQuery.of(context).size.width,
                                      ),
                                      Obx(
                                        () => controller.Vercel_isPressed.value
                                            ? Container(
                                                height:
                                                    25.57 / 100 * MediaQuery.of(context).size.height,
                                                width: 22.22 / 100 * MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 5, 252, 190),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Color.fromARGB(255,
                                                              17, 244, 187),
                                                          Color.fromARGB(255,
                                                              30, 167, 133),
                                                        ])),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0.766 /
                                                          100 *
                                                          MediaQuery.of(context).size.width,
                                                      vertical: 1.4 /
                                                          100 *
                                                          MediaQuery.of(context).size.height),
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text(
                                                            "Vercel",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 0.38 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.width,
                                                                  right: 0.38 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.width,
                                                                  top: 1.11 /
                                                                      100 *
                                                                      MediaQuery.of(context).size.height),
                                                          child: Align(
                                                            child: Container(
                                                              height: 18.1 /
                                                                  100 *
                                                                  MediaQuery.of(context).size.height,
                                                              child: ListView
                                                                  .builder(
                                                                itemCount:
                                                                    controller
                                                                        .projects
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal: 0.76 /
                                                                            100 *
                                                                            MediaQuery.of(context).size.width),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                color: Color.fromARGB(88, 249, 245, 245),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 0.76 / 100 * MediaQuery.of(context).size.width, vertical: 0.69 / 100 * MediaQuery.of(context).size.height),
                                                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                  Text(
                                                                                    controller.projects[index]['name'],
                                                                                    style: TextStyle(color: Colors.white, fontFamily: 'RobotoMono', fontSize: 13, fontWeight: FontWeight.w300),
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      InkWell(
                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                        onTap: () {
                                                                                          var uri = 'https://${controller.projects[index]['link']['type']}.com/${controller.projects[index]['link']['org']}/${controller.projects[index]['link']['repo']}';
                                                                                          print(uri);
                                                                                          launchUrl(Uri.parse(uri));
                                                                                        },
                                                                                        child: CircleAvatar(
                                                                                          backgroundColor: Color.fromARGB(56, 238, 235, 235),
                                                                                          child: Icon(
                                                                                            EvaIcons.github,
                                                                                            size: 2.22 / 100 * MediaQuery.of(context).size.height,
                                                                                            color: Color.fromARGB(210, 242, 242, 242),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(width: 1),
                                                                                      InkWell(
                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                        onTap: () {
                                                                                          print("yo");
                                                                                          var uri = 'https://${controller.projects[index]['latestDeployments'][0]['alias'][0]}';
                                                                                          print(uri);
                                                                                          launchUrl(Uri.parse(uri));
                                                                                        },
                                                                                        child: CircleAvatar(
                                                                                          backgroundColor: Color.fromARGB(56, 238, 235, 235),
                                                                                          child: Icon(
                                                                                            EvaIcons.globe,
                                                                                            size: 2.22 / 100 * MediaQuery.of(context).size.height,
                                                                                            color: Color.fromARGB(203, 255, 254, 254),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ]),
                                                                              ),
                                                                              width: 26.05 / 100 * MediaQuery.of(context).size.width,
                                                                              height: 4.87 / 100 * MediaQuery.of(context).size.height,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height: 1.67 /
                                                                              100 *
                                                                              MediaQuery.of(context).size.height,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            alignment: Alignment
                                                                .topCenter,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ),
                                      SizedBox(
                                        width: 2.083 / 100 * MediaQuery.of(context).size.width,
                                      ),
                                      Container(
                                        height: 25.57 / 100 * MediaQuery.of(context).size.height,
                                        width: 22.22 / 100 * MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 251, 9, 251),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(223, 184, 22, 202),
                                              Color.fromARGB(255, 242, 67, 242),
                                            ])),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    "Let's Connect",
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.white),
                                                  )),
                                              SizedBox(
                                                height: 1.46 / 100 * MediaQuery.of(context).size.height,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        2.43 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  Icon(
                                                    Icons.email_rounded,
                                                    color: Color.fromARGB(
                                                        140, 255, 255, 255),
                                                    size: 2.1924 /
                                                        100 *
                                                        MediaQuery.of(context).size.height,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        0.55 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        15.97 / 100 * MediaQuery.of(context).size.width,
                                                    child: TextField(
                                                      controller: controller
                                                          .email_feild,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 1.584 /
                                                              100 *
                                                              MediaQuery.of(context).size.height,
                                                          color: Color.fromARGB(
                                                              223,
                                                              237,
                                                              232,
                                                              232)),
                                                      decoration: InputDecoration(
                                                          hintText: "Email",
                                                          hintStyle: TextStyle(
                                                              fontSize: 1.584 /
                                                                  100 *
                                                                  MediaQuery.of(context).size.height,
                                                              color: Color
                                                                  .fromARGB(
                                                                      167,
                                                                      199,
                                                                      193,
                                                                      193)),
                                                          isDense: true,
                                                          border:
                                                              InputBorder.none),
                                                      cursorOpacityAnimates:
                                                          true,
                                                      cursorWidth: 0.138 /
                                                          100 *
                                                          MediaQuery.of(context).size.width,
                                                      cursorHeight: 1.58 /
                                                          100 *
                                                          MediaQuery.of(context).size.height,
                                                      cursorRadius:
                                                          Radius.circular(20),
                                                      cursorColor:
                                                          Color.fromARGB(
                                                              0, 195, 187, 187),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.73 / 100 * MediaQuery.of(context).size.height,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        2.43 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.github,
                                                    color: Color.fromARGB(
                                                        140, 255, 255, 255),
                                                    size: 2.1924 /
                                                        100 *
                                                        MediaQuery.of(context).size.height,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        0.55 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        15.97 / 100 * MediaQuery.of(context).size.width,
                                                    child: TextField(
                                                      controller: controller
                                                          .github_unme_feild,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 1.584 /
                                                              100 *
                                                              MediaQuery.of(context).size.height,
                                                          color: Color.fromARGB(
                                                              223,
                                                              237,
                                                              232,
                                                              232)),
                                                      decoration: InputDecoration(
                                                          hintText: "Github",
                                                          hintStyle: TextStyle(
                                                              fontSize: 1.584 /
                                                                  100 *
                                                                  MediaQuery.of(context).size.height,
                                                              color: Color
                                                                  .fromARGB(
                                                                      167,
                                                                      199,
                                                                      193,
                                                                      193)),
                                                          isDense: true,
                                                          border:
                                                              InputBorder.none),
                                                      cursorOpacityAnimates:
                                                          true,
                                                      cursorWidth: 0.138 /
                                                          100 *
                                                          MediaQuery.of(context).size.width,
                                                      cursorHeight: 1.58 /
                                                          100 *
                                                          MediaQuery.of(context).size.height,
                                                      cursorRadius:
                                                          Radius.circular(20),
                                                      cursorColor:
                                                          Color.fromARGB(
                                                              0, 195, 187, 187),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.73 / 100 * MediaQuery.of(context).size.height,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        2.43 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.twitter,
                                                    color: Color.fromARGB(
                                                        140, 255, 255, 255),
                                                    size: 2.1924 /
                                                        100 *
                                                        MediaQuery.of(context).size.height,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        0.55 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        15.97 / 100 * MediaQuery.of(context).size.width,
                                                    child: TextField(
                                                      controller: controller
                                                          .twitter_unme,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 1.584 /
                                                              100 *
                                                              MediaQuery.of(context).size.height,
                                                          color: Color.fromARGB(
                                                              223,
                                                              237,
                                                              232,
                                                              232)),
                                                      decoration: InputDecoration(
                                                          hintText: "Twitter",
                                                          hintStyle: TextStyle(
                                                              fontSize: 1.584 /
                                                                  100 *
                                                                  MediaQuery.of(context).size.height,
                                                              color: Color
                                                                  .fromARGB(
                                                                      167,
                                                                      199,
                                                                      193,
                                                                      193)),
                                                          isDense: true,
                                                          border:
                                                              InputBorder.none),
                                                      cursorOpacityAnimates:
                                                          true,
                                                      cursorWidth: 0.138 /
                                                          100 *
                                                          MediaQuery.of(context).size.width,
                                                      cursorHeight: 1.58 /
                                                          100 *
                                                          MediaQuery.of(context).size.height,
                                                      cursorRadius:
                                                          Radius.circular(20),
                                                      cursorColor:
                                                          Color.fromARGB(
                                                              0, 195, 187, 187),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.73 / 100 * MediaQuery.of(context).size.height,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        2.43 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.linkedin,
                                                    color: Color.fromARGB(
                                                        140, 255, 255, 255),
                                                    size: 2.1924 /
                                                        100 *
                                                        MediaQuery.of(context).size.height,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        0.55 / 100 * MediaQuery.of(context).size.width,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        15.97 / 100 * MediaQuery.of(context).size.width,
                                                    child: TextField(
                                                      controller: controller
                                                          .linkedIn_unme,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 1.584 /
                                                              100 *
                                                              MediaQuery.of(context).size.height,
                                                          color: Color.fromARGB(
                                                              223,
                                                              237,
                                                              232,
                                                              232)),
                                                      decoration: InputDecoration(
                                                          hintText: "Linkedin",
                                                          hintStyle: TextStyle(
                                                              fontSize: 1.584 /
                                                                  100 *
                                                                  MediaQuery.of(context).size.height,
                                                              color: Color
                                                                  .fromARGB(
                                                                      167,
                                                                      199,
                                                                      193,
                                                                      193)),
                                                          isDense: true,
                                                          border:
                                                              InputBorder.none),
                                                      cursorOpacityAnimates:
                                                          true,
                                                      cursorWidth: 0.138 /
                                                          100 *
                                                          MediaQuery.of(context).size.width,
                                                      cursorHeight: 1.58 /
                                                          100 *
                                                          MediaQuery.of(context).size.height,
                                                      cursorRadius:
                                                          Radius.circular(20),
                                                      cursorColor:
                                                          Color.fromARGB(
                                                              0, 195, 187, 187),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.5 / 100 * MediaQuery.of(context).size.height,
                                  ),
                                  Obx(
                                    () => controller
                                            .github_chart_isPressed.value
                                        ? Container(
                                            height: 24 / 100 * MediaQuery.of(context).size.height,
                                            width: 83.33 / 100 * MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: LinearGradient(
                                                    colors: const [
                                                      Color.fromARGB(
                                                          92, 98, 96, 96),
                                                      Color.fromARGB(
                                                          54, 77, 74, 74),
                                                      Color.fromARGB(
                                                          92, 98, 96, 96),
                                                    ])),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0.76 / 100 * MediaQuery.of(context).size.width,
                                                  right: 1.53 / 100 * MediaQuery.of(context).size.width,
                                                  bottom:
                                                      0.83 / 100 * MediaQuery.of(context).size.height),
                                              child: HeatMap(
                                                colorMode: ColorMode.opacity,
                                                colorsets: {
                                                  1: const Color.fromARGB(
                                                      255, 255, 153, 0)
                                                },
                                                size: 16,
                                                startDate: DateTime(
                                                    DateTime.now().year,
                                                    DateTime.now().month - 10,
                                                    DateTime.now().day - 7),
                                                showColorTip: false,
                                                datasets:
                                                    controller.impressions,
                                                onClick: (value) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(value
                                                              .toString())));
                                                },
                                                scrollable: true,
                                              ),
                                            ))
                                        : SizedBox(),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        )
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
