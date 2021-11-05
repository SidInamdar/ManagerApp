import 'package:flutter/material.dart';
import 'package:manager_app/AccountDisplayWidgets.dart';

class InputAccountInfoPage extends StatefulWidget {
  const InputAccountInfoPage({Key? key}) : super(key: key);

  @override
  _InputAccountInfoPageState createState() => _InputAccountInfoPageState();
}

class _InputAccountInfoPageState extends State<InputAccountInfoPage> {
  String _AccountName = 'Account 1';
  String _AccountBalance = '0.0';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildAccount() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Account Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (String? value) {
        _AccountName = value!;
      },
    );
  }

  Widget _buildBalance() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Balance'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Balance is required';
        }
      },
      onSaved: (String? value) {
        _AccountName = value!;
        print(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Account Info"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAccount(),
              _buildBalance(),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
         //           _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountsSection(
                              account: Account(
                                  AccountName: _AccountName,
                                  AccountBalance: _AccountBalance))),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class Account {
  final String AccountName;
  final String AccountBalance;

  Account({required this.AccountName , required this.AccountBalance});
}
