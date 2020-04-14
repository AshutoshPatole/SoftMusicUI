import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/activeButton.dart';
import 'package:musicplayer/Screens/HomePage.dart';

class ShortPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Lose It",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500, color: Colors.grey[400]),
                    ),
                    Text(
                      "Flume -Vic Mensa",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[400],
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.fast_rewind),
                  ActiveButton(
                    icon: Icons.pause,
                    size: 20,
                    height: 30,
                    width: 30,
                  ),
                  Icon(Icons.fast_forward)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
