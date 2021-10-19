import 'package:flutter/material.dart';
import 'package:bytebonk/models/transaction.dart';
import 'package:sqflite/sqflite.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionData> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transações'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final TransactionData transaction = transactions[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                transaction.contact.account.toString(),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
