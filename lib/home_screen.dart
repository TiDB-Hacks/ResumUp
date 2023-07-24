import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:progress_bar_steppers/steppers.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:appwrite/appwrite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var currentStep = 1;
  var totalSteps = 2;
  late List<StepperData> stepsData;
  late Client client;
  late Account account;
  @override
  void initState() {
    client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('64bda5974a3168ff237a')
        .setSelfSigned(status: true);
    account = Account(client);

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
                backgroundColor: Color.fromARGB(255, 26, 235, 235)),
            onPressed: () async {
              await account.createOAuth2Session(
                provider: 'github',
              );
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
                backgroundColor: Color.fromARGB(255, 20, 160, 160)),
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
              padding: EdgeInsets.only(left: 200, top: 260),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Resume",
                        style: TextStyle(
                            fontSize: 55,
                            color: Color.fromARGB(145, 255, 255, 255),
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Up.",
                        style: TextStyle(
                            fontSize: 55,
                            color: Color.fromARGB(157, 252, 160, 21),
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
              padding: const EdgeInsets.only(left: 670, top: 130),
              child: Container(
                height: 400,
                width: 350,
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
                        height: 15,
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
                        child: Steppers(
                          direction: StepperDirection.vertical,
                          labels: stepsData,
                          currentStep: currentStep,
                          stepBarStyle: StepperStyle(
                            activeColor: Colors.orange,
                            maxLineLabel: 2,
                            inactiveColor: Colors.blue,
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
