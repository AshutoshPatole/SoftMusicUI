import 'package:flutter/material.dart';

class ActiveButton extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;
  final double height;
  final double width;

  ActiveButton(
      {@required this.icon, this.color, this.size, this.height, this.width});

  @override
  _ActiveButtonState createState() => _ActiveButtonState();
}

class _ActiveButtonState extends State<ActiveButton> {
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
          color: Colors.orange[800],
        ),
        child: Container(
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange[800],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.orange[800],
                  Colors.orange[700],
                  Colors.orange[600],
                  Colors.orange[300],
                ],
                stops: [
                  0.3,
                  0.5,
                  0.7,
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
