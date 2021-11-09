import 'package:flutter/material.dart';
import 'AccountDisplayWidgets.dart';
import 'MakeChangesToAccountPage.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Manager App"),
        ),
        body: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[AccountsSection(), Container()],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MakeChangesToAccountPage()));
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////
