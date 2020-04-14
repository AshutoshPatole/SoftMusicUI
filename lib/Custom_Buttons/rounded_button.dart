import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;
  final double height;
  final double width;

  RoundedButton(
      {@required this.icon, this.color, this.size, this.height, this.width});

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              offset: Offset(-3, -3),
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.grey[800]),
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 5,
            spreadRadius: 1,
            color: Colors.grey[900],
          ),
        ],
      ),
      height: widget.height,
      width: widget.width,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[900],
        ),
        child: Container(
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[850],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.grey[700],
                  Colors.grey[800],
                  Colors.grey[850],
                  Colors.grey[900],
                ],
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9
                ]),
          ),
          child: Icon(
            widget.icon,
            size: widget.size,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
