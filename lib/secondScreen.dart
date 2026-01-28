import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarisZ_Flutter_Assignment_1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyStatisticPage(title: "Statistics",),
    );
  }
}

class MyStatisticPage extends StatefulWidget {
  final String title;
  const MyStatisticPage({super.key, required this.title});

  @override
  State<MyStatisticPage> createState() => _MyStatisticPageState();
}

class _MyStatisticPageState extends State<MyStatisticPage> {
  final int _randomNum = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBC6EB),
      appBar: AppBar(
        leading: Icon(Icons.house_outlined, size: 25),
        backgroundColor: Color(0xFFFFC0CB),
        title: Text(widget.title),
      ),
      body: Center(
        widthFactor: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 1", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20)),]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 2", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 3", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 4", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 5", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 6", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 7", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 8", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 9", style: TextStyle(fontSize: 20),), Text("0 times", style: TextStyle(fontSize: 20))])
            ],
          ),
        ),
      ),
    );
  }
}
