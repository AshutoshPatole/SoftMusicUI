import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';
import 'package:musicplayer/Screens/FavouritePage.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class FavouriteCard extends StatefulWidget {
  @override
  _FavouriteCardState createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FavouritePage()));
      },
      child: Container(
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
                bottom: 0,
                child: _buildCard(
                  context: context,
                  config: CustomConfig(
                    colors: [
                      Colors.grey[700],
                      Colors.grey[600],
                      Colors.grey[600],
                      Colors.grey[700],
                    ],
                    durations: [35000, 19440, 10800, 6000],
                    heightPercentages: [0.20, 0.23, 0.25, 0.30],
                    blur: MaskFilter.blur(BlurStyle.outer, 2.0),
                  ),
                  backgroundColor: Colors.grey[850],
                ),
              ),
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
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  ),
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
      ),
    );
  }
}

_buildCard(
    {Config config,
    Color backgroundColor = Colors.transparent,
    BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.07,
    child: WaveWidget(
      config: config,
      backgroundColor: backgroundColor,
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 0,
    ),
  );
}
