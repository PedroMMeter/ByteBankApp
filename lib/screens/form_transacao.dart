import 'package:bytebonk/components/textModel.dart';
import 'package:bytebonk/components/transactionAuthDialog.dart';
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
  final snackSucess = SnackBar(content: Text('TRANSAÇÃO BEM SUCEDIDA', style: TextStyle(fontSize: 20),));
  final snackFailure = SnackBar(content: Text('FALHA AO AUTENTICAR', style: TextStyle(fontSize: 20),));

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
              ),
              Text(
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
              onPressed: () {
                final value = double.tryParse(_valueController.text);
                final createdTransaction = TransactionData(value!, widget.contact);
                showDialog(
                    context: context,
                    builder: (contextDialog) {
                      return TransactionAuthDialog(
                        onConfirm: (String password) {
                          _createdTransaction(context, password, createdTransaction);
                        },
                      );
                    });

              }, //_createdTransaction(context);
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

  void _createdTransaction(BuildContext context, password, createdTransaction) async{
    Future.delayed(Duration(seconds: 1));
    transactionClient
        .saveTransaction(createdTransaction, password)
        .then((transaction){
      ScaffoldMessenger.of(context).showSnackBar(snackSucess);
      Navigator.pop(context);
    }).catchError((e){
      ScaffoldMessenger.of(context).showSnackBar(snackFailure);
    });
  }
}
