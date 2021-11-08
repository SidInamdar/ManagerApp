import 'package:flutter/material.dart';
import 'package:manager_app/InputAccountInfoPage.dart';
import 'InputAccountInfoPage.dart';

class AccountsSection extends StatefulWidget {

  AccountsSection({Key? key}) : super(key: key);

  // final Stream<Account> stream;

  @override
  _AccountsSectionState createState()  => _AccountsSectionState();

}

class _AccountsSectionState extends State<AccountsSection> {
   Account account= Account(accountName: 'CASH', accountBalance: '10.0');

   List<Widget> displayAccountsList = <Widget>[AccountDisplayButton(accountName: 'Account 1', accountBalance: '20.0'),
     SizedBox(width: 10.0)];

  @override
  Widget build(BuildContext context) {
    return Container(
        //    alignment: ,
        width: double.infinity,
        height: 150.0,
        padding: EdgeInsets.all(5.0),
        color: Colors.black12,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: displayAccountsList +
              <Widget>[
                TextButton.icon(
                  onPressed: () {

                  Future newaccount = Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InputAccountInfoPage()));

                  newaccount.then((value) {
                    final acc = value;
                    addItemToAccountsList(acc);
                    setState(() {
                      displayAccountsList = accountsList;
                    });
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

List<Widget> accountsList = <Widget>[AccountDisplayButton(accountName: 'Account 1', accountBalance: '20.0'),
  SizedBox(width: 10.0)];

void addItemToAccountsList (Account account) {
  accountsList.add(AccountDisplayButton(accountName: account.accountName, accountBalance: account.accountBalance));
 accountsList.add(SizedBox(width: 10.0));
}
