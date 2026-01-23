import 'package:farisz_flutter_assignment1/main.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarisZ_Flutter_Assignment_1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyStatisticPage(),
    );
  }
}

class MyStatisticPage extends StatefulWidget {
  const MyStatisticPage({super.key});

  @override
  State<MyStatisticPage> createState() => _MyStatisticPageState();
}

class _MyStatisticPageState extends State<MyStatisticPage> {
  int _randomNum = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBC6EB),
      appBar: AppBar(
        leading: Icon(Icons.house, size: 25),
        backgroundColor: Color(0xFFFFC0CB),
      ),
      body: Center(
        widthFactor: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Number 1     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20)),]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 2     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 3     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 4     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 5     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 6     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 7     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 8     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Number 9     ", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))])
          ],
        ),
      ),
    );
  }
}
