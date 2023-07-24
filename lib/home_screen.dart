import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:progress_bar_steppers/steppers.dart';
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
    stepsData = [
      StepperData(
        label: 'Step 1',
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ElevatedButton(
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
                fixedSize: Size(200, 32),
                backgroundColor: (controller.currentStep.value == 1)
                    ? Color.fromARGB(255, 26, 235, 235)
                    : Color.fromARGB(255, 20, 160, 160)),
            onPressed: () async {
              await controller.gitSignIn();
            },
          ),
        ),
      ),
      StepperData(
        label: 'Step 2',
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ElevatedButton(
            child: Text(
              'Sign In to Vercel',
              style: TextStyle(
                  color: Color.fromARGB(255, 66, 66, 66), fontFamily: 'Ubuntu'),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 32),
                backgroundColor: (controller.currentStep.value == 1)
                    ? Color.fromARGB(255, 20, 160, 160)
                    : Color.fromARGB(255, 26, 235, 235)),
            onPressed: () {},
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
        body: Stack(children: [
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
        ]));
  }
}
