import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MakeChangesToAccountPage extends StatefulWidget {
  const MakeChangesToAccountPage({Key? key}) : super(key: key);

  @override
  _MakeChangesToAccountPageState createState() => _MakeChangesToAccountPageState();
}

class _MakeChangesToAccountPageState extends State<MakeChangesToAccountPage> {
String _accountName = "Account 1";
String _inputAmount = "0.0";
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  String? chosenInputMethod;
  List inputMethodsList = <String>['Income', 'Expense'];

  Widget _buildInputMethodDropDown() {
    return DropdownButton<String>(
     value: chosenInputMethod,
     hint: Text('Select Input Method'),
     onChanged: (value) {
       setState(() {
         chosenInputMethod = value;
       });
     },
      items: inputMethodsList.map((valueItem) {
        return DropdownMenuItem<String>(value: valueItem ,child: Text(valueItem));
      }).toList(),
    );
  }
  
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

Widget _buildInputAmount() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Amount'),
    keyboardType: TextInputType.number,
    validator: (String? value) {
      if (value!.isEmpty) {
        return 'Name is required';
      }
    },
    onSaved: (String? value) {
      if (value!.isNotEmpty)  _inputAmount = value;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income or Expense to Account'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildInputMethodDropDown(),
              _buildAccount(),
              _buildInputAmount(),
              TextButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if(_formKey2.currentState!.validate()) _formKey2.currentState!.save();
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
