import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';

class FavouriteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.88,
      child: Container(
        decoration: BoxDecoration(
              color: Colors.grey[850],
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-3, -3),
                  color: Colors.grey[800],
                  blurRadius: 1,
                  spreadRadius: 1),
              BoxShadow(
                  offset: Offset(3, 3),
                  color: Colors.grey[900],
                  blurRadius: 1,
                  spreadRadius: 1),
            ]),
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              left: 10,
              child: RoundedButton(
                icon: FontAwesomeIcons.solidHeart,
                size: 10,
                color: Colors.redAccent,
                width: 50,
                height: 50,
              ),
            ),
            Positioned(
              bottom: 45,
              left: 25,
              child: Text(
                "Favourites",
                style: GoogleFonts.ubuntu(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 25,
              left: 25,
              child: Text(
                "Ashutosh",
                style: GoogleFonts.ubuntu(
                  color: Colors.grey[400],
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              right: 30,
              child: Text(
                "356",
                style: GoogleFonts.ubuntu(
                    color: Colors.grey[400], fontWeight: FontWeight.bold, ),
              ),
            ),
            Positioned(
              bottom: 25,
              right: 25,
              child: Text(
                "Songs",
                style: GoogleFonts.ubuntu(
                  color: Colors.grey[400],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
