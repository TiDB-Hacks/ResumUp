// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resumup/controller/resume_build_controller.dart';
import 'package:sizer/sizer.dart';
import 'bindings/resume_build_bindings.dart';
import 'home_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      initialBinding: Resume_Build_Bindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }));
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 1.38.w, vertical: 2.43.h),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Container(
                  width: 20.83.w,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(207, 216, 134, 11),
                    Color.fromARGB(211, 245, 181, 116)
                  ])),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.69.w, vertical: 1.21.h),
                      child: Obx(
                        () => Column(
                          children: <Widget>[
                            SizedBox(
                              height: 0.6.h,
                            ),
                            Card(
                              color: Colors.black,
                              child: SizedBox(
                                width: double.infinity,
                                height: 3.65.h,
                                child: Center(
                                    child: Text(
                                  "Pick your Widgets",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 1.21.h,
                            ),
                            Divider(
                              indent: 1.041.w,
                              endIndent: 1.041.w,
                              thickness: 0.24.h,
                            ),
                            SizedBox(
                              height: 1.21.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 27.04.h,
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
                                            splashColor:
                                                Color.fromRGBO(244, 93, 7, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            onTap: () {
                                              controller
                                                      .Vercel_isPressed.value =
                                                  !controller
                                                      .Vercel_isPressed.value;
                                            },
                                            child: SizedBox(
                                                height: 11.57.h,
                                                width: 6.94.w,
                                                child: Center(
                                                    child: Text(
                                                  'Vercel',
                                                  style: TextStyle(
                                                      fontSize: 1.33.h),
                                                ))),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.97.h,
                                      ),
                                      Material(
                                        borderRadius: BorderRadius.circular(90),
                                        color: controller
                                                .profile_isPressed.value
                                            ? Color.fromARGB(57, 249, 245, 245)
                                            : Colors.transparent,
                                        child: InkWell(
                                          highlightColor:
                                              Color.fromARGB(206, 235, 145, 81),
                                          splashColor:
                                              Color.fromARGB(212, 230, 98, 22),
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          onTap: () {
                                            controller.profile_isPressed.value =
                                                !controller
                                                    .profile_isPressed.value;
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0.3.h,
                                                horizontal: 0.347.w),
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        Color.fromARGB(
                                                            255, 237, 20, 92),
                                                        Color.fromARGB(
                                                            255, 235, 66, 122)
                                                      ])),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0.347.w,
                                                    vertical: 0.6.h),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          170, 150, 3, 163),
                                                  radius: 2.74.h + 1.5.w,
                                                  child: SizedBox(
                                                      height: 11.57.h,
                                                      width: 6.94.w,
                                                      child: Center(
                                                          child: Text(
                                                        "Image Icon",
                                                        style: TextStyle(
                                                            fontSize: 1.46.h,
                                                            color:
                                                                Colors.white),
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
                                SizedBox(width: 0.69.w),
                                Material(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color:
                                      controller.github_issues_isPressed.value
                                          ? Color.fromARGB(57, 249, 245, 245)
                                          : Colors.transparent,
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    highlightColor:
                                        Color.fromARGB(206, 235, 145, 81),
                                    splashColor: Color.fromRGBO(244, 93, 7, 1),
                                    onTap: () {
                                      controller.github_issues_isPressed.value =
                                          !controller
                                              .github_issues_isPressed.value;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.41.w, vertical: 0.73.h),
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
                                            height: 25.57.h,
                                            width: 9.72.w,
                                            child: Center(
                                              child: Text(
                                                "Github Issues",
                                                style: TextStyle(
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
                              height: 6.09.h,
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
                                      !controller.github_chart_isPressed.value;
                                },
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.55.w, vertical: 0.97.h),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: const [
                                              Color.fromARGB(255, 57, 158, 60),
                                              Color.fromARGB(255, 12, 91, 15)
                                            ])),
                                    height: 17.05.h,
                                    width: 18.75.w,
                                    child: Center(
                                      child: Text(
                                        'GitHub Chart',
                                        style: TextStyle(color: Colors.white),
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
            padding: EdgeInsets.symmetric(vertical: 2.43.h),
            child: SizedBox(
              width: 75.4.w,
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
                                fontSize: 2.43.h,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w100)),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          highlightColor: Colors.orange,
                          splashColor: Colors.amber,
                          onTap: () {},
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 213, 134, 15),
                                  Color.fromARGB(255, 225, 158, 58)
                                ])),
                            child: SizedBox(
                              height: 3.65.h,
                              width: 5.55.w,
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
                      height: 1.827.h,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      dashPattern: [6, 3, 6, 3],
                      color: Colors.amber,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.73.h, horizontal: 0.4166.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 87.2.h,
                          width: 76.388888.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.43.h, horizontal: 1.38.w),
                            child: Column(children: [
                              SizedBox(
                                height: 4.85.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 12.18.h,
                                  ),
                                  Obx(
                                    () => controller.profile_isPressed.value
                                        ? Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color.fromARGB(
                                                          255, 26, 153, 182),
                                                      Color.fromARGB(
                                                          255, 81, 215, 245),
                                                    ])),
                                            child: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.black,
                                                radius: 2.36.w + 4.14.h,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.18.h + 6.94.w),
                                                  child: Expanded(
                                                      child: Image.network(
                                                          'https://static.vecteezy.com/system/resources/previews/021/548/095/original/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg')),
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                  SizedBox(
                                    width: 1.38.w,
                                  ),
                                  Container(
                                    width: 34.72.w,
                                    height: 15.83.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: const Color.fromARGB(
                                                151, 123, 121, 95)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0416666.w,
                                            vertical: 1.218.h),
                                        child: Column(children: [
                                          TextField(
                                            style: TextStyle(
                                                fontSize: 1.43.h + 0.83.w,
                                                fontWeight: FontWeight.w200,
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                                hintText: "What's Your Name",
                                                hintStyle: TextStyle(
                                                    fontSize: 1.43.h + 0.83.w,
                                                    color: Color.fromARGB(
                                                        146, 150, 137, 137)),
                                                border: InputBorder.none),
                                            cursorOpacityAnimates: true,
                                            cursorWidth: 0.138.w,
                                            cursorHeight: 2.679.h,
                                            cursorRadius: Radius.circular(20),
                                            cursorColor: Color.fromARGB(
                                                0, 195, 187, 187),
                                          ),
                                          TextField(
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 1.8.h,
                                                color: Color.fromARGB(
                                                    171, 217, 213, 213)),
                                            decoration: InputDecoration(
                                                hintText: "More about ya",
                                                hintStyle: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: Color.fromARGB(
                                                        109, 150, 137, 137)),
                                                isDense: true,
                                                border: InputBorder.none),
                                            cursorOpacityAnimates: true,
                                            cursorWidth: 0.138.w,
                                            cursorHeight: 1.948.h,
                                            cursorRadius: Radius.circular(20),
                                            cursorColor: Color.fromARGB(
                                                0, 195, 187, 187),
                                          ),
                                        ])),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4.85.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 0.347.w,
                                  ),
                                  Obx(
                                    () => controller
                                            .github_issues_isPressed.value
                                        ? Container(
                                            height: 25.57.h,
                                            width: 22.22.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 151, 239, 11),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color.fromARGB(
                                                          255, 146, 221, 25),
                                                      Color.fromARGB(
                                                          233, 78, 172, 24),
                                                    ])),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0.694.w,
                                                  vertical: 1.21.h),
                                              child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    "Github Issues",
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                  SizedBox(
                                    width: 2.083.w,
                                  ),
                                  Obx(
                                    () => controller.Vercel_isPressed.value
                                        ? Container(
                                            height: 25.57.h,
                                            width: 22.22.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 5, 252, 190),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color.fromARGB(
                                                          255, 17, 244, 187),
                                                      Color.fromARGB(
                                                          255, 30, 167, 133),
                                                    ])),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    "Vercel",
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                  SizedBox(
                                    width: 2.083.w,
                                  ),
                                  Container(
                                    height: 25.57.h,
                                    width: 22.22.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 251, 9, 251),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(223, 184, 22, 202),
                                          Color.fromARGB(255, 242, 67, 242),
                                        ])),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "Let's Connect",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    color: Colors.white),
                                              )),
                                          SizedBox(
                                            height: 1.46.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 2.43.w,
                                              ),
                                              Icon(
                                                Icons.email_rounded,
                                                color: Color.fromARGB(
                                                    140, 255, 255, 255),
                                                size: 2.1924.h,
                                              ),
                                              SizedBox(
                                                width: 0.55.w,
                                              ),
                                              SizedBox(
                                                width: 15.97.w,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: 1.584.h,
                                                      color: Color.fromARGB(
                                                          223, 237, 232, 232)),
                                                  decoration: InputDecoration(
                                                      hintText: "Email",
                                                      hintStyle: TextStyle(
                                                          fontSize: 1.584.h,
                                                          color: Color.fromARGB(
                                                              167,
                                                              199,
                                                              193,
                                                              193)),
                                                      isDense: true,
                                                      border: InputBorder.none),
                                                  cursorOpacityAnimates: true,
                                                  cursorWidth: 0.138.w,
                                                  cursorHeight: 1.58.h,
                                                  cursorRadius:
                                                      Radius.circular(20),
                                                  cursorColor: Color.fromARGB(
                                                      0, 195, 187, 187),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0.73.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 2.43.w,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.github,
                                                color: Color.fromARGB(
                                                    140, 255, 255, 255),
                                                size: 2.1924.h,
                                              ),
                                              SizedBox(
                                                width: 0.55.w,
                                              ),
                                              SizedBox(
                                                width: 15.97.w,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: 1.584.h,
                                                      color: Color.fromARGB(
                                                          223, 237, 232, 232)),
                                                  decoration: InputDecoration(
                                                      hintText: "Github",
                                                      hintStyle: TextStyle(
                                                          fontSize: 1.584.h,
                                                          color: Color.fromARGB(
                                                              167,
                                                              199,
                                                              193,
                                                              193)),
                                                      isDense: true,
                                                      border: InputBorder.none),
                                                  cursorOpacityAnimates: true,
                                                  cursorWidth: 0.138.w,
                                                  cursorHeight: 1.58.h,
                                                  cursorRadius:
                                                      Radius.circular(20),
                                                  cursorColor: Color.fromARGB(
                                                      0, 195, 187, 187),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0.73.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 2.43.w,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.twitter,
                                                color: Color.fromARGB(
                                                    140, 255, 255, 255),
                                                size: 2.1924.h,
                                              ),
                                              SizedBox(
                                                width: 0.55.w,
                                              ),
                                              SizedBox(
                                                width: 15.97.w,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: 1.584.h,
                                                      color: Color.fromARGB(
                                                          223, 237, 232, 232)),
                                                  decoration: InputDecoration(
                                                      hintText: "Twitter",
                                                      hintStyle: TextStyle(
                                                          fontSize: 1.584.h,
                                                          color: Color.fromARGB(
                                                              167,
                                                              199,
                                                              193,
                                                              193)),
                                                      isDense: true,
                                                      border: InputBorder.none),
                                                  cursorOpacityAnimates: true,
                                                  cursorWidth: 0.138.w,
                                                  cursorHeight: 1.58.h,
                                                  cursorRadius:
                                                      Radius.circular(20),
                                                  cursorColor: Color.fromARGB(
                                                      0, 195, 187, 187),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0.73.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 2.43.w,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.linkedin,
                                                color: Color.fromARGB(
                                                    140, 255, 255, 255),
                                                size: 2.1924.h,
                                              ),
                                              SizedBox(
                                                width: 0.55.w,
                                              ),
                                              SizedBox(
                                                width: 15.97.w,
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: 1.584.h,
                                                      color: Color.fromARGB(
                                                          223, 237, 232, 232)),
                                                  decoration: InputDecoration(
                                                      hintText: "Linkedin",
                                                      hintStyle: TextStyle(
                                                          fontSize: 1.584.h,
                                                          color: Color.fromARGB(
                                                              167,
                                                              199,
                                                              193,
                                                              193)),
                                                      isDense: true,
                                                      border: InputBorder.none),
                                                  cursorOpacityAnimates: true,
                                                  cursorWidth: 0.138.w,
                                                  cursorHeight: 1.58.h,
                                                  cursorRadius:
                                                      Radius.circular(20),
                                                  cursorColor: Color.fromARGB(
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
                                height: 4.5.h,
                              ),
                              Obx(
                                () => controller.github_chart_isPressed.value
                                    ? Container(
                                        height: 24.h,
                                        width: 83.33.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient:
                                                LinearGradient(colors: const [
                                              Color.fromARGB(92, 98, 96, 96),
                                              Color.fromARGB(54, 77, 74, 74),
                                              Color.fromARGB(92, 98, 96, 96),
                                            ])),
                                      )
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
    );
  }
}
