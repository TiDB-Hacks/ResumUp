import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:progress_bar_steppers/steppers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller/resume_build_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var totalSteps = 2;
  late List<StepperData> stepsData;
  var controller = Get.find<ResumeBuildController>();
  @override
  void initState() {
    controller.checkStep();
    stepsData = [
      StepperData(
        label: 'Step 1',
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(
            () => ElevatedButton(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.github,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign In to Github',
                    style: TextStyle(
                        color: Color.fromARGB(255, 66, 66, 66),
                        fontFamily: 'Ubuntu'),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Color.fromARGB(255, 20, 160, 160),
                  fixedSize: Size(200, 32),
                  backgroundColor: Color.fromARGB(255, 26, 235, 235)),
              onPressed: controller.currentStep.value == 1
                  ? () async {
                      await controller.gitSignIn();
                    }
                  : null,
            ),
          ),
        ),
      ),
      StepperData(
        label: 'Step 2',
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(
            () => ElevatedButton(
              child: Text(
                'Provide Vercel Auth-Token',
                style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontFamily: 'Ubuntu'),
              ),
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Color.fromARGB(255, 20, 160, 160),
                  fixedSize: Size(230, 32),
                  backgroundColor: Color.fromARGB(255, 26, 235, 235)),
              onPressed: controller.currentStep.value == 2
                  ? () {
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) => AlertDialog(
                                elevation: 20,
                                title: Text(
                                  "Vercel Auth-Token",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(190, 183, 178, 178)),
                                ),
                                backgroundColor: Colors.black,
                                content: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Please provide your vercel auth token, refer ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  189, 131, 125, 125)),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await launchUrl(Uri.parse(
                                                'https://vercel.com/docs/rest-api#creating-an-access-token:~:text=Creating%20an%20Access%20Token'));
                                          },
                                          child: Text(
                                            'here',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    192, 33, 149, 243)),
                                          ),
                                        ),
                                        Text(
                                          ' for more info (make sure to set Scope: Full Account and expiration: None)',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  189, 131, 125, 125)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    TextField(
                                      controller: controller
                                          .auth_token_feild_controller,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 72, 68, 68)),
                                      cursorRadius: Radius.circular(20),
                                      cursorColor:
                                          Color.fromARGB(95, 88, 87, 87),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      135, 50, 49, 49))),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      72, 72, 65, 65))),
                                          hintText: 'Enter Auth Token',
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                135, 118, 116, 116),
                                          )),
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          controller.currentStep.value = 3;
                                          Navigator.pop(context);
                                          controller.auth_token = controller
                                              .auth_token_feild_controller.text;
                                          controller.initialization.value =
                                              true;
                                          print(controller.auth_token);

                                          await controller.putToken();
                                          controller.initialization.value =
                                              false;
                                        },
                                        child: Text('Submit'))
                                  ],
                                )),
                              ));
                    }
                  : null,
            ),
          ),
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
        body: Obx(
          () => Stack(children: [
            const Positioned(
              child: Padding(
                padding: EdgeInsets.only(left: 200, top: 300),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Resume",
                          style: TextStyle(
                              fontSize: 55,
                              color: Color.fromARGB(228, 255, 255, 255),
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "Up.",
                          style: TextStyle(
                              fontSize: 55,
                              color: Color.fromARGB(224, 252, 160, 21),
                              fontFamily: 'Poppins'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(left: 670, top: 145),
                child: Container(
                  height: 500,
                  width: 450,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Color.fromARGB(198, 56, 55, 55))
                      ],
                      backgroundBlendMode: BlendMode.difference,
                      color: Color.fromARGB(255, 50, 49, 49),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Build your Dream Portfolio here ⚡️⚡️",
                              style: TextStyle(
                                  color: Color.fromARGB(208, 255, 255, 255),
                                  fontSize: 15,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Lets Get ya Started",
                          style: TextStyle(
                              color: Color.fromARGB(208, 255, 255, 255),
                              fontSize: 15,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Obx(
                            () => Steppers(
                              direction: StepperDirection.vertical,
                              labels: stepsData,
                              currentStep: controller.currentStep.value,
                              stepBarStyle: StepperStyle(
                                activeColor: Colors.orange,
                                maxLineLabel: 2,
                                inactiveColor: Colors.blue,
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
            controller.initialization.value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                        child: LoadingAnimationWidget.threeRotatingDots(
                            color: Colors.orange, size: Get.pixelRatio * 20)),
                  )
                : SizedBox(),
            controller.hasDeployed.value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const  Center(
                        child: AlertDialog(
                      elevation: 20,
                      title: Text(
                        "You have already created a deployment",
                        style: TextStyle(
                            color: Color.fromARGB(190, 183, 178, 178)),
                      ),
                      backgroundColor: Colors.black,
                      content: SingleChildScrollView(
                        child: Text(
                          'One deployment per user supported as of now',
                          style: TextStyle(
                              color: Color.fromARGB(189, 131, 125, 125)),
                        ),
                      ),
                    )),
                  )
                : SizedBox(),
          ]),
        ));
  }
}
