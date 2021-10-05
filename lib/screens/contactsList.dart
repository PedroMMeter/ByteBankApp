import 'package:bytebonk/database/dao/contact_dao.dart';
import 'package:bytebonk/models/contact.dart';
import 'package:bytebonk/screens/newContact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  //final List<Contact> _lContact = [];

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
        future: Future.delayed(Duration(milliseconds: 700)).then((value) => _dao.buscar()),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) { // ignore: missing_enum_constant_in_switch
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading!!!'),
                  ],
                ),
              );
              // ignore: dead_code
              break;
            case ConnectionState.done:
              final List<Contact> lContact = snapshot.data;
              return ListView.builder(
                itemCount: lContact.length,
                itemBuilder: (context, index) {
                  final Contact contact = lContact[index];
                  return ContactData(contact);
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
          ).then((value) {
            setState((){});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactData extends StatelessWidget {
  final Contact _contact;

  ContactData(this._contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          '${_contact.account}',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
