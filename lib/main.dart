import 'package:farisz_flutter_assignment1/secondScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarisZ_Flutter_Assignment_1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: "Random Number Generator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _randomNum = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void generateRandomNumber() {
    int counter = 0;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (counter == 6) {
        timer.cancel();
      } else {
        setState(() {
          counter++;
          Random randomObject = Random();
          _randomNum = 1 + randomObject.nextInt(9);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2196F4),
      appBar: AppBar(
        leading: Icon(Icons.home_outlined, size: 25),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF147CD4),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            RotationTransition(
              turns: _controller,
              child: Text(
                '$_randomNum',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF147CD4),
                  onPressed: () {
                    generateRandomNumber();
                    _controller.duration = const Duration(milliseconds: 600);
                    _controller.reset(); // back to 0.0
                    _controller.forward();
                  },
                  tooltip: 'Increment',
                  child: Text(
                    'Generate',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF147CD4),
                  onPressed: () {
                    null;
                  },
                  tooltip: 'Increment',
                  child: Text(
                    'View Statistics',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
