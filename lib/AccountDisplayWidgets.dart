import 'package:flutter/material.dart';
import 'package:manager_app/InputAccountInfoPage.dart';
import 'InputAccountInfoPage.dart';

class AccountsSection extends StatefulWidget {
  final Account account;
  AccountsSection({Key? key, required this.account}) : super(key: key);
  List<Widget> accountsList = <Widget>[
    AccountDisplayButton(accountName: 'Account 1', accountBalance: '20.0'),
    SizedBox(width: 10.0)
  ];
  List<Widget> addItemToAccountsList(
      {String AccountName: 'Account 1', String AccountBalanace: '20.0'}) {
    accountsList.add(AccountDisplayButton(
        accountName: AccountName, accountBalance: AccountBalanace));
    accountsList.add(SizedBox(width: 10.0));
    return accountsList;
  }

  @override
  _AccountsSectionState createState() {
    this.accountsList = addItemToAccountsList(
        AccountName: this.account.AccountName,
        AccountBalanace: this.account.AccountBalance);
    return _AccountsSectionState();
  }
}

class _AccountsSectionState extends State<AccountsSection> {
  Widget build(BuildContext context) {
    return Container(
        //    alignment: ,
        width: double.infinity,
        height: 150.0,
        padding: EdgeInsets.all(5.0),
        color: Colors.black12,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget.accountsList +
              <Widget>[
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      // addItemToAccountsList();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputAccountInfoPage()));
                    });
                  },
                  icon: Icon(IconData(57419, fontFamily: 'MaterialIcons')),
                  label: Text('ADD'),
                )
              ],
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

/*List<Widget> accountsList = <Widget>[AccountDisplayButton(accountName: 'Account 1', accountBalance: '20.0'),
  SizedBox(width: 10.0)];

List<Widget> addItemToAccountsList ({String AccountName : 'Account 1', String AccountBalanace : '20.0'}) {
  accountsList.add(AccountDisplayButton(accountName: AccountName, accountBalance: AccountBalanace));
 accountsList.add(SizedBox(width: 10.0));
  return accountsList;
}*/
