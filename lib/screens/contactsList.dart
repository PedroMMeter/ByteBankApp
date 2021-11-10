import 'package:bytebonk/components/progress.dart';
import 'package:bytebonk/database/dao/contact_dao.dart';
import 'package:bytebonk/models/contact.dart';
import 'package:bytebonk/screens/alterContact.dart';
import 'package:bytebonk/screens/form_transacao.dart';
import 'package:bytebonk/screens/newContact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = new ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder(
        initialData: [],
        future: Future.delayed(Duration(milliseconds: 700))
            .then((value) => _dao.buscar()),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {// ignore: missing_enum_constant_in_switch
            case ConnectionState.waiting:
              return Progress();
              // ignore: dead_code
              break;
            case ConnectionState.done:
              final List<Contact> lContact = snapshot.data;
              return ListView.separated(
                itemCount: lContact.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final Contact contact = lContact[index];
                  return ContactData(
                    contact,
                    onClick: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransactionForm(contact))),
                  );
                },
              );
              // ignore: dead_code
              break;
          }
          return Text('Erro ao Carregar Lista');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => RegisterContact(),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactData extends StatelessWidget {
  final Contact _contact;
  final ContactDao dao = new ContactDao();
  final Function onClick;

  ContactData(this._contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () => onClick(),
      title: Text(_contact.name, style: TextStyle(fontSize: 24)),
      subtitle: Text('${_contact.account}', style: TextStyle(fontSize: 16)),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _sendDataForward(context),
            ),
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title:
                                Text('Deseja realmente excluir o contato: ${_contact.name}'),
                            content:
                              Text('(A ação é irreversivel)'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('CANCELAR'),
                              ),
                              TextButton(
                                onPressed: () {
                                  dao.deletar(_contact.id);
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactsList()));
                                },
                                child: Text('CONFIRMAR'),
                              ),
                            ],
                          ));
                }),
          ],
        ),
      ),
    ));
  }

  void _sendDataForward(BuildContext context) {
    final contactToAlter =
        Contact(_contact.id, _contact.name, _contact.account);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AlterContact(contactToAlter: contactToAlter),
        ));
  }
}
