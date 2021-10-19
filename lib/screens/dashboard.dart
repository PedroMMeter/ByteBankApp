import 'package:bytebonk/screens/transactionsList.dart';
import 'package:flutter/material.dart';

import 'contactsList.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        child: InkWell(
          onTap: () {

          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/bytebank_logo.png'),
              ),
              /*
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      Text(
                        'Contatos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              */
              Row(
                children: [
                  _DashButton(Icons.monetization_on, 'Transfer', onClick: () => _sendToContacts(context)),
                  _DashButton(Icons.assignment_rounded, 'Transaction Feed', onClick: () => _sendToTransferList(context),),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
  void _sendToContacts(BuildContext context) {
    Navigator.of(context).push(
      (MaterialPageRoute(
        builder: (context) =>
        ContactsList(),
      )),
    );
  }void _sendToTransferList(BuildContext context) {
    Navigator.of(context).push(
      (MaterialPageRoute(
        builder: (context) =>
        TransactionList(),
      )),
    );
  }
}

class _DashButton extends StatelessWidget {
  final IconData icon;
  final String mainText;
  final Function onClick;

  _DashButton(this.icon, this.mainText, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            width: 150,
            padding: const EdgeInsets.all(10.0),
            height: 100,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Text(
                  mainText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

