import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
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
                  child: Column(
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
                            height: 214,
                            child: Column(
                              children: [
                                const Card(
                                  child: SizedBox(
                                      height: 95,
                                      width: 100,
                                      child: Center(
                                          child: Text(
                                        'Vercel',
                                        style: TextStyle(fontSize: 11),
                                      ))),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(255, 237, 20, 92),
                                        Color.fromARGB(255, 235, 66, 122)
                                      ])),
                                  child: Card(
                                    color: Color.fromARGB(0, 255, 255, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: const SizedBox(
                                        height: 95,
                                        width: 100,
                                        child: Center(
                                            child: Text(
                                          "Image Icon",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 94, 235, 99),
                                        Color.fromARGB(255, 17, 135, 21)
                                      ])),
                              child: const SizedBox(
                                  height: 210,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Github Issues",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
