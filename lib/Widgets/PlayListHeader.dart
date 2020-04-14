import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';

class PlayListHeader extends StatelessWidget {
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
                "Playlists",
                style: GoogleFonts.ubuntu(
                    fontSize: 24, letterSpacing: 1, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                "16 created playlists",
                style: GoogleFonts.ubuntu(fontSize: 14, letterSpacing: 1),
              )
            ],
          ),
          RoundedButton(
            icon: Icons.add,
            height: 50,
            width: 50,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
}
