import 'package:flutter/material.dart';

class InputAccountInfoPage extends StatefulWidget {
  const InputAccountInfoPage({Key? key}) : super(key: key);

  @override
  _InputAccountInfoPageState createState() => _InputAccountInfoPageState();
}

class _InputAccountInfoPageState extends State<InputAccountInfoPage> {
  String _accountName = 'Account 1';
  String _accountBalance = '0.0';

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
        if (value!.isNotEmpty)  _accountName = value;
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
        if (value!.isNotEmpty) _accountBalance = value;
        print(value);
      },
    );
  }
final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAccount(),
              _buildBalance(),
              SizedBox(
                height: 100,
              ),
              TextButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                   if(_formKey.currentState!.validate()) _formKey.currentState!.save();
                    Navigator.pop(context,Account(accountName: _accountName, accountBalance: _accountBalance));
                  })
            ],
          ),
        ),
      ),
    );
  }
}


class Account {
  final String accountName;
  final String accountBalance;

  Account({required this.accountName , required this.accountBalance});
}
