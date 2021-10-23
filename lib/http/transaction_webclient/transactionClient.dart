import 'dart:convert';
import 'package:bytebonk/models/contact.dart';
import 'package:bytebonk/models/transaction.dart';
import 'package:http/http.dart';
import '../webClient.dart';

class TransactionWebClent {
  Future<List<TransactionData>> findAll() async {
    final Response response =
        await client.get(Uri.parse(baseURL)).timeout(Duration(seconds: 6));
    final List<dynamic> jList = jsonDecode(response.body);
    final List<TransactionData> transactions = [];
    for (Map<String, dynamic> transactionsJson in jList) {
      final Map<String, dynamic> jContact = transactionsJson['contact'];
      final TransactionData transaction = TransactionData(
        transactionsJson['value'],
        Contact(
          0,
          jContact['name'],
          jContact['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }
    return transactions;
  }

  Future<TransactionData> saveTransaction(TransactionData transaction) async {

    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.account,
      }
    };

    final String jTransaction = jsonEncode(transactionMap);

    final Response response = await client.post(Uri.parse(baseURL), headers: {
      'Content-Type': 'application/json',
      'password': '1000',},
        body: jTransaction);

    Map<String, dynamic> json = jsonDecode(response.body);
    final Map<String, dynamic> contactJson = json['contact'];
    return TransactionData(
      json['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
  }
}


