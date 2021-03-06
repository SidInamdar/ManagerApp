import 'package:flutter/material.dart';

class AccountsSection extends StatefulWidget {

  const AccountsSection({Key? key}) : super(key: key);

  @override
  _AccountsSectionState createState() => _AccountsSectionState();


}

class _AccountsSectionState extends State<AccountsSection> {
 //  @override
  List<Widget> accountsList = <Widget>[AccountDisplayButton(accountName: 'Account 1', accountBalance: '20.0'),
                                        SizedBox(width: 10.0)];

  void addItemToAccountsList () {
    this.accountsList.add(AccountDisplayButton(accountName: 'Account 1', accountBalance: '20.0'));
        this.accountsList.add(SizedBox(width: 10.0));
  }

  Widget build(BuildContext context) {
    return Container(
      //    alignment: ,
      width: double.infinity,
      height: 150.0,
      padding: EdgeInsets.all(5.0),
      color: Colors.black12,
      child: ListView(
        scrollDirection: Axis.horizontal,
          children: this.accountsList + <Widget>[TextButton.icon(onPressed: () {setState(() {
            addItemToAccountsList();
          });}, icon: Icon(IconData(57419, fontFamily: 'MaterialIcons')),label: Text('ADD'),)],
    ));

  }
}

class AccountDisplayButton extends StatefulWidget {
  final String accountName;
  final String accountBalance;
  const AccountDisplayButton(
      {Key? key, required this.accountName, required this.accountBalance})
      : super(key: key);

  @override
  _AccountDisplayButtonState createState() => _AccountDisplayButtonState();
}

class _AccountDisplayButtonState extends State<AccountDisplayButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.yellow,
          backgroundColor: Colors.black54,
          textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
      child: Column(
        children: <Widget>[
          Text(widget.accountName),
          Text(widget.accountBalance)
        ],
      ),
      onPressed: () {},
    );
  }
}

