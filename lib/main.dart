import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

const textColor = Colors.white;
const normalFontSize = 20.0;
const appBarColor = Color(0xFF147CD3);
const bodyAppColor = Color(0xFF2196F3);
const buttonAppColor = Color(0xFF147CD3);

final ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: buttonAppColor, 
  foregroundColor: textColor,
  elevation: 4,
  textStyle: TextStyle(
    fontSize: normalFontSize,
  )
);


void main() {
  runApp(const MyApp());
}

// -------------------------------
// Number Generator Dart Screen
// -------------------------------
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
  final NumberContainer _numberContainer = NumberContainer();

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
        _numberContainer.increaseGeneratedNumberTimes(_randomNum);
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
      backgroundColor: bodyAppColor,
      appBar: AppBar(
        leading: Icon(Icons.home_outlined, size: 25),
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: appBarColor,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: normalFontSize, color: textColor),
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
                child: ElevatedButton(
                  style: _elevatedButtonStyle,
                  onPressed: () {
                    generateRandomNumber();
                    _controller.duration = const Duration(milliseconds: 600);
                    _controller.reset(); // back to 0.0
                    _controller.forward();
                  },
                  child: Text(
                    'Generate',
                    style: TextStyle(color: textColor, fontSize: normalFontSize),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style : _elevatedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const MyStatisticPage(title: "Statistics"),
                      ),
                    );
                  },
                  child: Text(
                    'View Statistics',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor, fontSize: normalFontSize),
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

// -------------------------------
// Statistics Dart Page
// -------------------------------
class MyStatisticPage extends StatefulWidget {
  final String title;
  const MyStatisticPage({super.key, required this.title});

  @override
  State<MyStatisticPage> createState() => _MyStatisticPageState();
}

class _MyStatisticPageState extends State<MyStatisticPage> {
  final NumberContainer _numberContainer = NumberContainer();


  void _resetNumberContainerList() {
    setState(() {
      _numberContainer.resetNumberList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyAppColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, size: 25),
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: appBarColor,
        title: Text(widget.title, style: TextStyle(fontSize: normalFontSize, color: textColor)),
      ),
      body: Center(
        widthFactor: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 1", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[0]} times", style: TextStyle(fontSize: normalFontSize, color: textColor)),]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 2", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[1]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 3", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[2]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 4", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[3]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 5", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[4]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 6", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[5]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 7", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[6]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 8", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[7]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 9", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberList()[8]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              )
            ],
          ),
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
                child: ElevatedButton(
                  style: _elevatedButtonStyle,
                  onPressed: () {
                    _resetNumberContainerList();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(color: textColor, fontSize: normalFontSize),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: _elevatedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Back To Statistics',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor, fontSize: normalFontSize),
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

// -------------------------------
// NumberContainer class
// -------------------------------
class NumberContainer {
  static final List<int> _numberList = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  NumberContainer();

  List<int> getNumberList() {
      return _numberList;
  }

  void resetNumberList() {
    for (int number = 0; number < _numberList.length; number++) {
        _numberList[number] = 0;
    }
  }

  void increaseGeneratedNumberTimes(int generatedNum) {
    switch (generatedNum) {
      case 1:
        _numberList[0] += 1;
        break;
      case 2:
        _numberList[1] += 1;
        break;
      case 3:
        _numberList[2] += 1;
        break;
      case 4:
        _numberList[3] += 1;
        break;
      case 5:
        _numberList[4] += 1;
        break;
      case 6:
        _numberList[5] += 1;
        break;
      case 7:
        _numberList[6] += 1;
        break;
      case 8:
        _numberList[7] += 1;
        break;
      default:
        _numberList[8] += 1;
        break;
    }
  }
}