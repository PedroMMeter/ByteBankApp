import 'package:bytebonk/components/centralMessage.dart';
import 'package:bytebonk/components/progress.dart';
import 'package:bytebonk/http/transaction_webclient/transactionClient.dart';
import 'package:flutter/material.dart';
import 'package:bytebonk/models/transaction.dart';


class TransactionList extends StatelessWidget {
  final transactionWebClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transações'),
      ),
      body: FutureBuilder<List<TransactionData>>(
          future:
              Future.delayed(Duration(seconds: 1)).then((value) => transactionWebClient.findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Progress();
                // ignore: dead_code
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<TransactionData>? transactions = snapshot.data;
                  if (transactions!.isNotEmpty) {
                    return ListView.builder(
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
                    );
                  }
                }
                return CentralMessage(
                    'No Transactions Were Found', Icons.warning_amber_outlined);
                // ignore: dead_code
                break;
            }
            return Text('Erro Desconhecido');
          }),
    );
  }
}
