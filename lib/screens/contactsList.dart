import 'package:bytebonk/models/contact.dart';
import 'package:bytebonk/screens/newContact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  final List<Contact> _lContact = [];

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: widget._lContact.length,
        itemBuilder: (context, index) {
          final contact = widget._lContact[index];
          return ContactData(contact);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contact?> future=
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return RegisterContact();
              }));
          future.then((recievedContact){
            Future.delayed(Duration(milliseconds: 700), () {
              setState((){
                widget._lContact.add(recievedContact!);
              });
            });
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
    return ListTile(
      title: Text(_contact.name, style:  TextStyle(fontSize: 24),),
      subtitle: Text('${_contact.account}', style: TextStyle(fontSize: 16),),
    );
  }
}
