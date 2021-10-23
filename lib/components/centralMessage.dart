import 'package:flutter/material.dart';

class CentralMessage extends StatelessWidget {
  final String message;
  final IconData? icon;
  final double iconSize;
  final double fSize;

  CentralMessage(this.message, this.icon,
      {this.iconSize = 64, this.fSize = 24});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            child: Icon(
              icon,
              size: iconSize,
            ),
            visible: icon != null,
          ),
          Padding(padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            message,
            style: TextStyle(fontSize: fSize),
          )),
        ],
      ),
    );
  }
}
