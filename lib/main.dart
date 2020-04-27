import 'package:flutter/material.dart';
import 'package:musicplayer/Screens/PlayList.dart';

void main() => runApp(Start());

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: PlayList(),
    );
  }
}
