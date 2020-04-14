import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.5,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 0.5,
              spreadRadius: 0.5,
              offset: Offset(-1, -1),
              color: Colors.grey[800]),
          BoxShadow(
              blurRadius: 0.5,
              spreadRadius: 0.5,
              offset: Offset(1, 1),
              color: Colors.grey[900]),
        ],
      ),
    );
  }
}
