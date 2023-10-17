import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  runAnimation() {
    if (controller.value == 1) {
      controller.animateBack(0);
    } else {
      controller.forward();
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello world!"),
        ),
        body: Center(
            child: GestureDetector(
                onTap: runAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset.zero,
                              end:
                                  const Offset(1.0 / 500 * 170, 1.0 / 500 * 70))
                          .animate(controller),
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0 / 360 * -45)
                            .animate(controller),
                        child: SizedBox(
                          width: 140,
                          height: 300,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )),
                            child: const Center(
                                child: Text("1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 64))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 300,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )),
                        child: const Center(
                            child: Text("2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 64))),
                      ),
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset.zero,
                              end: const Offset(
                                  1.0 / 500 * -170, 1.0 / 500 * 70))
                          .animate(controller),
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0 / 360 * 45)
                            .animate(controller),
                        child: SizedBox(
                          width: 140,
                          height: 300,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )),
                            child: const Center(
                                child: Text("3",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 64))),
                          ),
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
