import 'dart:convert';
import 'package:bytebonk/models/transaction.dart';
import 'package:http/http.dart';
import '../webClient.dart';

class TransactionWebClient {
  Future<List<TransactionData>> findAll() async {
    final Response response =
    await client.get(Uri.parse(baseURL)).timeout(Duration(seconds: 6));
    return _toTransactions(response);
  }

  List<TransactionData> _toTransactions(Response response) {
    final List<dynamic> jList = jsonDecode(response.body);

    final List<TransactionData> transactions = jList.map((dynamic json){
      return TransactionData.fromJson(json);
    }).toList();

    // final List<TransactionData> transactions = [];
    // for (Map<String, dynamic> transactionsJson in jList) {
    //   transactions.add(TransactionData.fromJson(transactionsJson));
    // }
    return transactions;
  }

  Future<TransactionData> saveTransaction(TransactionData transaction) async {
    // Map<String, dynamic> transactionMap = _toMap(transaction);
    final String jTransaction = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.parse(baseURL),
        headers: {
          'Content-Type': 'application/json',
          'password': '1000',
        },
        body: jTransaction);

    return TransactionData.fromJson(jsonDecode(response.body));
  }
}
//   TransactionData _toTransaction(Response response) {
//     Map<String, dynamic> json = jsonDecode(response.body);
//     return TransactionData.fromJson(json);
//   }
//
//   Map<String, dynamic> _toMap(TransactionData transaction) {
//     final Map<String, dynamic> transactionMap = {
//       'value': transaction.value,
//       'contact': {
//         'name': transaction.contact.name,
//         'accountNumber': transaction.contact.account,
//       }
//     };
//     return transactionMap;
//   }
// }
