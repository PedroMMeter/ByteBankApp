import 'package:bytebonk/palette.dart';
import 'package:flutter/material.dart';
import 'package:bytebonk/screens/dashboard.dart';
import 'package:bytebonk/screens/contacts.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Palette.darkGreen)
            .copyWith(secondary: Colors.blueAccent[400]),
      ),
      home: Dashboard(),
    );
  }
}
