import 'package:bytebonk/database/dao/contact_dao.dart';
import 'package:bytebonk/models/contact.dart';
import 'package:flutter/material.dart';
import '../components/textModel.dart';

const _appBarTitle = 'Novo Contato';
const _nameLabel = 'Nome';
const _nameHint = 'Nome do Contato';
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
  final ContactDao _dao = new ContactDao();

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
        ),
        new TextModel(
          _accountController,
          _accountLabel,
          _accountHint,
          type: _keyboardType,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.maxFinite,
            height: 50,
            child: ElevatedButton(
              onPressed: () => _createContact(context),
              child: Text(
                'Cadastrar',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void _createContact(BuildContext context) {
    final name = _nameController.text;
    final account = int.tryParse(_accountController.text);

    if (name != '' && account != null) {
      final createdContact = Contact(0, name, account);
      _dao.salvar(createdContact).then((id) =>Navigator.pop(context));
    }
  }
}
