import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumup/controller/resume_build_controller.dart';

import 'bindings/resume_build_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Resume_Build_Bindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(207, 216, 134, 11),
                    Color.fromARGB(211, 245, 181, 116)
                  ])),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Obx(
                        () => Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 5,
                            ),
                            const Card(
                              color: Colors.black,
                              child: SizedBox(
                                width: double.infinity,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  "Pick your Widgets",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              indent: 15,
                              endIndent: 15,
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 222,
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
                                            child: const SizedBox(
                                                height: 95,
                                                width: 100,
                                                child: Center(
                                                    child: Text(
                                                  'Vercel',
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ))),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
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
                                            padding: EdgeInsets.all(5),
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
                                              child: const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          170, 150, 3, 163),
                                                  radius: 45,
                                                  child: SizedBox(
                                                      height: 95,
                                                      width: 100,
                                                      child: Center(
                                                          child: Text(
                                                        "Image Icon",
                                                        style: TextStyle(
                                                            fontSize: 12,
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
                                const SizedBox(width: 10),
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
                                      padding: EdgeInsets.all(6),
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
                                        child: const SizedBox(
                                            height: 210,
                                            width: 140,
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
                            const SizedBox(
                              height: 50,
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
                                  padding: EdgeInsets.all(8),
                                  child: Ink(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(255, 57, 158, 60),
                                              Color.fromARGB(255, 12, 91, 15)
                                            ])),
                                    height: 140,
                                    width: 270,
                                    child: const Center(
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
          AspectRatio(
            aspectRatio: 33 / 25,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                // color: const Color.fromARGB(255, 9, 63, 11),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Portfolio Preview",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
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
                              child: const SizedBox(
                                height: 30,
                                width: 80,
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
                      const SizedBox(
                        height: 15,
                      ),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        dashPattern: [6, 3, 6, 3],
                        color: Colors.amber,
                        padding: const EdgeInsets.all(6),
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: SizedBox(
                            height: 720,
                            width: 1100,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
