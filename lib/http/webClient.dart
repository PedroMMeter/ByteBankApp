import 'dart:convert';
import 'package:bytebonk/http/interceptors/loggingInterceptor.dart';
import 'package:bytebonk/models/contact.dart';
import 'package:bytebonk/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client =
InterceptedClient.build(interceptors: [LoggingInterceptor()]);
final String baseURL = 'http://192.168.1.12:8080/transactions';

Future<TransactionData> salvar(TransactionData transaction) async {

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
