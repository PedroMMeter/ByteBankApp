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
    return transactions;
  }

  Future<TransactionData> saveTransaction(TransactionData transaction, String password) async {
    final String jTransaction = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.parse(baseURL),
        headers: {
          'Content-Type': 'application/json',
          'password': password,
        },
        body: jTransaction);
    if(response.statusCode != 200) {
      throw new Exception('Ocorreu um erro: ${response.statusCode}');
    }
      return TransactionData.fromJson(jsonDecode(response.body));
  }
}
