import 'package:flutter/material.dart';

class RoundedImage extends StatefulWidget {
  final Widget child;
  final double size;
  final Color color;
  final double height;
  final double width;

  RoundedImage(
      {this.height, this.width, this.color, this.size, @required this.child});

  @override
  _RoundedImageState createState() => _RoundedImageState();
}

class _RoundedImageState extends State<RoundedImage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[850],
            ),
            child: ClipOval(child: widget.child),
          ),
        ),
      ),
    );
  }
}
