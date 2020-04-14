import 'package:flutter/material.dart';

class RoundedImage extends StatefulWidget {
  final String link;
  final double size;
  final Color color;
  final double height;
  final double width;

  RoundedImage(
      {this.height, this.width, this.color, this.size, @required this.link});

  @override
  _RoundedImageState createState() => _RoundedImageState();
}

class _RoundedImageState extends State<RoundedImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
              offset: Offset(-5, -5),
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.grey[800]),
          BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.grey[900]),
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
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[850],
              image: DecorationImage(
                image: NetworkImage(widget.link),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
