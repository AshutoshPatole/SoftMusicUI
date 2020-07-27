import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PlayListHeader extends StatefulWidget {
  @override
  _PlayListHeaderState createState() => _PlayListHeaderState();
}

class _PlayListHeaderState extends State<PlayListHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.125,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          _buildCard(
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
              blur: MaskFilter.blur(BlurStyle.outer, 5.0),
            ),
            backgroundColor: Colors.grey[850],
          ),
          Positioned(
            left: 40,
            top: 30,
            child: Text(
              "Songs",
              style: GoogleFonts.ubuntu(
                  fontSize: 24,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70),
            ),
          ),
        ],
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
