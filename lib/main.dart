import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
          children: [
            Image.asset('images/bytebank_logo.png'),
            Container(
              width: 100,
              height: 120,
              color: Colors.green,
              child: Column(
                children: [
                  Icon(Icons.people),
                  Text('Contatos'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
