import 'package:flutter/material.dart';
import 'AccountDisplayWidgets.dart';
import 'InputAccountInfoPage.dart';

void main() {
  runApp(MyApp());
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
              children: <Widget>[AccountsSection(account: Account(AccountName: "CASH", AccountBalance: "0.0"),), Container()],
            ),
          )),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////
