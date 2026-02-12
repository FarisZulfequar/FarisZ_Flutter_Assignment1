import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';


int _randomNum = 0;
int _currentSession = 0;
const textColor = Colors.white;
const normalFontSize = 20.0;
const appBarColor = Color(0xFF147CD3);
const bodyAppColor = Color(0xFF2196F3);
const buttonAppColor = Color(0xFF147CD3);

// All the following ElevatedButton and its styles was taken from the flutter documentation in the resources.txt file #3
// Creates a style for the elevated buttos
final ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: buttonAppColor, 
  foregroundColor: textColor,
  elevation: 4,
  textStyle: TextStyle(
    fontSize: normalFontSize,
  ),
  minimumSize: Size(double.infinity, 55),
  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))
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
  
  // All AnimationController code was taken from the flutter documentation in the resources.txt file #7
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
    _currentSession++;
    // This variable signals that each timer has its own unique ID
    int _currentSessionID = _currentSession;
    int counter = 0;
    // Creates a timer that lasts for 0.1 seconds and runs 6 times
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (counter == 6) {
        timer.cancel();

        // Since each timer has its own ID it will compare to the latest timer session, if true, it will increment the generated number
        // for the statistics page
        if (_currentSessionID == _currentSession) {
        _numberContainer.increaseGeneratedNumberTimes(_randomNum);
      }
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
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.home_outlined, size: 25),
          onPressed: () {},
        ),
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
            // This specfic code was taken from the flutter documentation in the resources.txt file #6
            RotationTransition(
              turns: _controller,
              child: Text(
                _randomNum == 0 ? '' : '$_randomNum',
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
                // This specfic code was taken from the flutter documentation in the resources.txt file #2
                child: ElevatedButton(
                  style: _elevatedButtonStyle,
                  onPressed: () {
                    generateRandomNumber();
                    // Rotates the Text for 0.6 seconds
                    _controller.duration = const Duration(milliseconds: 600);
                    _controller.reset(); // back to 0.0
                    _controller.forward();
                  },
                  child: Text(
                    'Generate',
                    style: TextStyle(
                      color: textColor,
                      fontSize: normalFontSize,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: ElevatedButton(
                style: _elevatedButtonStyle,
                onPressed: () async {
                   // This specfic code was taken from the flutter documentation in the resources.txt file #1.5
                   // When the navigation comes back it will get a value of true or false
                  final didReset = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyStatisticPage(title: "Statistics"),
                    ),
                  );
                  if (didReset == true) {
                    setState(() {
                      // Forces the _randomNum to change its state to 0, therefore make the text a empty string
                      _randomNum = 0;
                    });
                  }
                },
                child: Text(
                  'View Statistics',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor, fontSize: normalFontSize),
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
  bool _didReset = false;

  void _resetNumberContainerList() {
    setState(() {
      // Resets all the numbers to 0
      _numberContainer.resetNumberList();
      _didReset = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyAppColor,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 25),
          onPressed: () {
              Navigator.pop(context, _didReset);
          },
        ),
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
            // This specfic code was taken from the flutter documentation in the resources.txt file #2, #4
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 1", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[1]} times", style: TextStyle(fontSize: normalFontSize, color: textColor)),]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 2", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[2]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 3", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[3]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 4", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[4]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 5", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[5]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 6", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[6]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 7", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[7]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 8", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[8]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 9", style: TextStyle(fontSize: normalFontSize, color: textColor),), Text("${_numberContainer.getNumberMap()[9]} times", style: TextStyle(fontSize: normalFontSize, color: textColor))]),
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
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: ElevatedButton(
                  style: _elevatedButtonStyle,
                  onPressed: () {
                    // This specfic code was taken from the flutter documentation in the resources.txt file #1 and #1.5
                    // Returns back to the homepage along with a value from the _didReset 
                    Navigator.pop(context, _didReset);
                  },
                  child: Text(
                    'Back To Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor, fontSize: normalFontSize),
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
  static final Map<int, int> _numberMap = {
    1: 0, 2: 0, 3: 0,
    4: 0, 5: 0, 6: 0, 
    7: 0, 8: 0, 9: 0,
    };
    
  NumberContainer();

  Map<int, int> getNumberMap() {
      return _numberMap;
  }

  void resetNumberList() {
    for (int number in _numberMap.keys) {
        _numberMap[number] = 0;
    }
    _randomNum = 0;
  }

  void increaseGeneratedNumberTimes(int generatedNum) {
    // This specfic code was taken from the flutter documentation in the resources.txt file #8
    if (_numberMap.containsKey(generatedNum)) {
     _numberMap[generatedNum] = (_numberMap[generatedNum] ?? 0) + 1;
    }
  }
}

/*

Some code in the program was copy and pasted and changed slightly or used at references. 
Each link will be numbered and will be told in the program which link was used:

1. https://docs.flutter.dev/cookbook/navigation/navigation-basics

1.5. https://docs.flutter.dev/cookbook/navigation/returning-data

2. https://api.flutter.dev/flutter/widgets/Padding-class.html

3. https://api.flutter.dev/flutter/material/ButtonStyle-class.html

4. https://api.flutter.dev/flutter/widgets/Row-class.html

6. https://api.flutter.dev/flutter/widgets/RotationTransition-class.html

7. https://api.flutter.dev/flutter/animation/AnimationController-class.html

8. https://api.flutter.dev/flutter/dart-core/Map/containsKey.html

*/