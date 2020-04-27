import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';

class PlayListHeader extends StatefulWidget {
  @override
  _PlayListHeaderState createState() => _PlayListHeaderState();
}

class _PlayListHeaderState extends State<PlayListHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Songs",
                style: GoogleFonts.ubuntu(
                    fontSize: 24,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
            ],
          ),
//          GestureDetector(
//            child: RoundedButton(
//              icon: Icons.add,
//              height: 50,
//              width: 50,
//              color: Colors.grey[300],
//            ),
//          )
        ],
      ),
    );
  }
}
