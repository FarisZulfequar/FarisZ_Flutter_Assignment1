import 'package:flutter/material.dart';
import 'dart:math';

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
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Random Number Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _randomNum = 0;

  void generateRandomNumber() {
    setState(() {
      Random randomObject = new Random();
    _randomNum = 1 + randomObject.nextInt(9);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBC6EB),
      appBar: AppBar(
        leading: Icon(Icons.house, size: 25),
        backgroundColor: Color(0xFFFFC0CB),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              '$_randomNum',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
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
                  onPressed: generateRandomNumber,
                  tooltip: 'Increment',
                  child: Text('Generate'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  onPressed: () {
                    null;
                  },
                  tooltip: 'Increment',
                  child: Text('View Statistics', textAlign: TextAlign.center),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
