import 'package:bytebonk/palette.dart';
import 'package:flutter/material.dart';
import 'package:bytebonk/screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Palette.darkGreen,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[700],
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Palette.darkGreen)
            .copyWith(secondary: Colors.green[700]),
      ),
      home: Dashboard(),
    );
  }
}
