import 'package:flutter/material.dart';
import 'package:farisz_flutter_assignment1/Data/NumberContainer.dart';

class StatisticPageRoute extends StatelessWidget {
  const StatisticPageRoute({super.key});

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
  NumberContainer _numberContainer = NumberContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2196F4),
      appBar: AppBar(
        leading: Icon(Icons.house_outlined, size: 25),
        backgroundColor: Color(0xFF147CD4),
        title: Text(widget.title, style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      body: Center(
        widthFactor: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 1", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[0]} times", style: TextStyle(fontSize: 20, color: Colors.white)),]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 2", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[1]} times", style: TextStyle(fontSize: 20, color: Colors.white))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 3", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[2]} times", style: TextStyle(fontSize: 20, color: Colors.white))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 4", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[3]} times", style: TextStyle(fontSize: 20, color: Colors.white))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 5", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[4]} times", style: TextStyle(fontSize: 20, color: Colors.white))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 6", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[5]} times", style: TextStyle(fontSize: 20, color: Colors.white))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 7", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[6]} times", style: TextStyle(fontSize: 20, color: Colors.white))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 8", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[7]} times", style: TextStyle(fontSize: 20, color: Colors.white))]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Number 9", style: TextStyle(fontSize: 20, color: Colors.white),), Text("${_numberContainer.getNumberList()[8]} times", style: TextStyle(fontSize: 20, color: Colors.white))])
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
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF147CD4),
                  onPressed: () {
                  
                  },
                  tooltip: 'Reset',
                  child: Text(
                    'Reset',
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
                    Navigator.of(context).pop();
                  },
                  tooltip: 'Go Back',
                  child: Text(
                    'Back To Statistics',
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
