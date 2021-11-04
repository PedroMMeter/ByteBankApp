import 'package:bytebonk/components/textModel.dart';
import 'package:bytebonk/http/transaction_webclient/transactionClient.dart';
import 'package:bytebonk/models/contact.dart';
import 'package:bytebonk/models/transaction.dart';
import 'package:flutter/material.dart';

final String _valueLabel = 'Valor';
final String _valueHint = '0,00';
const _keyboardType = TextInputType.number;

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _valueController = TextEditingController();
  final transactionClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferir'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Text(
                widget.contact.name.toString(),
                style: TextStyle(
                  fontSize: 32.0,
                ),
              ),Text(
                widget.contact.account.toString(),
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        new TextModel(
          _valueController,
          _valueLabel,
          _valueHint,
          type: _keyboardType,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.maxFinite,
            height: 50,
            child: ElevatedButton(
              onPressed: () {_createdTransaction(context);},
              child: Text(
                'Transferir',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ]),
    );
  }
  void _createdTransaction(BuildContext context) {
    final value = double.tryParse(_valueController.text);
    final createdTransaction = TransactionData(value!, widget.contact);
    transactionClient.saveTransaction(createdTransaction).then((transaction) => Navigator.pop(context));
}
}
