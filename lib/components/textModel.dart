import 'package:flutter/material.dart';

class TextModel extends StatelessWidget {
  final TextEditingController infoController;
  final String label;
  final String hint;
  final TextInputType? type;

  TextModel(this.infoController, this.label, this.hint,{this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: infoController,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
        keyboardType: type,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
