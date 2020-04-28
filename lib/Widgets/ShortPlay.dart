import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/activeButton.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';
import 'package:musicplayer/Screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShortPlay extends StatefulWidget {
  @override
  _ShortPlayState createState() => _ShortPlayState();
}

class _ShortPlayState extends State<ShortPlay> {
  String _storedSongName, _storedSingerName, _storedFilePath, _storedSongArtWork;

  String shortSongName, shortSingerName;

  Future getCurrentSongDetail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _storedSongName = sharedPreferences.getString('currentSongName');
      _storedSingerName = sharedPreferences.getString('currentSongSingerName');
      _storedFilePath = sharedPreferences.getString('currentSongFilePath');
      _storedSongArtWork = sharedPreferences.getString('songArtWork');
      if (_storedSongName.length > 10) {
        setState(() {
          _storedSongName = _storedSongName.substring(0, 20);
        });
      }
    });
  }

  @override
  void initState() {
    getCurrentSongDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      songName: _storedSongName,
                      singerName: _storedSingerName,
                      filePath: _storedFilePath,
                      songArtWork: _storedSongArtWork,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      _storedSongName ?? "Loading..",
                      maxLines: 2,
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500, color: Colors.grey[400]),
                    ),
                    AutoSizeText(
                      _storedSingerName ?? "Loading..",
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
                  RoundedButton(
                    icon: Icons.fast_rewind,
                    width: 40,
                    height: 40,
                    size: 20,
                  ),
                  ActiveButton(
                    icon: Icons.pause,
                    size: 20,
                    height: 40,
                    width: 40,
                  ),
                  RoundedButton(
                    icon: Icons.fast_forward,
                    width: 40,
                    height: 40,
                    size: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
