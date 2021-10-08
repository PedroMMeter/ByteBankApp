import 'package:bytebonk/database/dao/contact_dao.dart';
import 'package:bytebonk/models/contact.dart';
import 'package:flutter/material.dart';
import '../components/textModel.dart';
import 'contactsList.dart';

const _appBarTitle = 'Alterar Contato';
const _nameLabel = 'Nome';
const _nameHint = 'Nome do Contato';
const _accountLabel = 'Número da Conta';
const _accountHint = '0000';
const _keyboardType = TextInputType.number;

class AlterContact extends StatefulWidget {
  final Contact contactToAlter;

  AlterContact({required this.contactToAlter});

  @override
  _AlterContactState createState() {
    return _AlterContactState(contactToAlter);
  }
}

class _AlterContactState extends State<AlterContact> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _accountController = TextEditingController();
  final Contact contactToAlter;
  final ContactDao _dao = new ContactDao();

  _AlterContactState(this.contactToAlter);

  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: '${contactToAlter.name}');
    _accountController =
        new TextEditingController(text: '${contactToAlter.account}');
  }

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
              onPressed: () => _alterContact(context),
              child: Text(
                'Alterar',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void _alterContact(BuildContext context) {
    final name = _nameController.text;
    final account = int.tryParse(_accountController.text);

    if (name != '' && account != null) {

      final createdContact = Contact(contactToAlter.id, name, account);
      _dao
          .alterar(createdContact)
          .then((id) =>  Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ContactsList())));
    }
  }
}
