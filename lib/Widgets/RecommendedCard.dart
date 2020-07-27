import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';

class RecommendedCard extends StatefulWidget {
  final IconData icon;
  final String categoryName;
  final String name;

  RecommendedCard({Key key, this.icon, this.categoryName, this.name});

  @override
  _RecommendedCardState createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.50,
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
                icon: widget.icon,
                size: 15,
                color: Colors.grey[400],
                width: 50,
                height: 50,
              ),
            ),
            Positioned(
              bottom: 45,
              left: 20,
              child: Text(
                widget.categoryName,
                style: GoogleFonts.ubuntu(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 25,
              left: 20,
              child: Text(
                widget.name,
                style: GoogleFonts.ubuntu(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
