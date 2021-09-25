import 'package:flutter/material.dart';
import '../components/textModel.dart';

const _appBarTitle = 'Novo Contato';
const _nameLabel = 'Nome';
const _nameHint = 'Nome do Produto';
const _accountLabel = 'Número da Conta';
const _accountHint = '0000';
const _keyboardType = TextInputType.number;

class RegisterContact extends StatefulWidget {
  @override
  _RegisterContactState createState() => _RegisterContactState();
}

class _RegisterContactState extends State<RegisterContact> {
  final _nameController = TextEditingController();
  final _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Column(children: <Widget>[
        new TextModel(
          _nameController,
          _nameLabel,
          _nameHint,
        ),new TextModel(
          _accountController,
          _accountLabel,
          _accountHint,
          type: _keyboardType,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {},
              child: Text('Cadastrar'),
          ),
        ),
      ]),
    );
  }

}
