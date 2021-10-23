import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
 final String mensagem;

 Progress({this.mensagem = 'Loading!'});

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(mensagem),
        ],
      ),
    );
  }
}
