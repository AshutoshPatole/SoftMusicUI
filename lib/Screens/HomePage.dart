import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/activeButton.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';
import 'package:musicplayer/Custom_Buttons/rounded_image.dart';
import 'package:musicplayer/Screens/PlayList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String songName;
  final String singerName;
  final String filePath;
  final String songArtWork;

  const HomePage(
      {Key key,
      this.songName,
      this.singerName,
      this.filePath,
      this.songArtWork})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(
      this.songName, this.singerName, this.filePath, this.songArtWork);
}

class _HomePageState extends State<HomePage> {
  final String songName;
  final String singerName;
  final String filePath;
  final String songArtWork;

  _HomePageState(
      this.songName, this.singerName, this.filePath, this.songArtWork);

  AudioPlayer audioPlayer;
  AudioPlayerState songStatus = AudioPlayerState.COMPLETED;
  String _storedSongName, _storedSingerName, _storedFilePath;
  bool isPlaying = true;
  bool buttonPressed = false;

  void activeButton() {
    setState(() {
      buttonPressed = !buttonPressed;
    });
  }

  playAudioFromLocalStorage(path) async {
    int response = await audioPlayer.play(path, isLocal: true);
    if (response == 1) {
      //Success
    } else {
      print('Some error occured in playing from storage!');
    }
  }

  Future storeSongDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('currentSongName', songName);
    preferences.setString('currentSongSingerName', singerName);
    preferences.setString('currentSongFilePath', filePath);
    preferences.setString('songArtWork', songArtWork);
  }

  Future getSongDetailsFromCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (_storedSongName == null &&
        _storedSingerName == null &&
        _storedFilePath == null) {
      setState(() {
        _storedSongName = preferences.getString('currentSongName');
        _storedSingerName = preferences.getString('currentSongSingerName');
        _storedFilePath = preferences.getString('currentSongFilePath');
      });
    }
  }

  pauseAudio() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
      // success
    } else {
      print('Some error occured in pausing');
    }
  }

  resumeAudio() async {
    int response = await audioPlayer.resume();
    if (response == 1) {
      // success
    } else {
      print('Some error occured in resuming');
    }
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer(playerId: 'Song');

    super.initState();
  }

  void stateOfSong() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        songStatus = state;
      });
    });
  }

  Future<bool> _backPressed() async {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PlayList()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backPressed,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PlayList())),
                      child: RoundedButton(
                        height: 40,
                        width: 40,
                        icon: FontAwesomeIcons.arrowLeft,
                        color: Colors.grey[300],
                        size: 15,
                      ),
                    ),
                    Text(
                      "PLAYING NOW",
                      style: GoogleFonts.ubuntu(color: Colors.grey[600]),
                    ),
                    Container(
                      width: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                RoundedImage(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: songArtWork == null
                      ? Image.asset(
                          'images/default_music.jpg',
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(songArtWork),
                          fit: BoxFit.cover,
                        ),
                ),
//                SizedBox(
//                  height: MediaQuery.of(context).size.height * 0.03,
//                ),
//

                Spacer(),
                Column(
                  children: <Widget>[
                    Text(
                      songName.substring(0, 15) + "...",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                          fontSize: 25, color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      singerName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                          fontSize: 14, color: Colors.grey[500]),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButton(
                      icon: Icons.fast_rewind,
                      height: 60,
                      width: 60,
                      size: 20,
                      color: Colors.grey[300],
                    ),
                    songStatus == AudioPlayerState.COMPLETED
                        ? GestureDetector(
                            onTap: () {
                              playAudioFromLocalStorage(filePath);
                              storeSongDetails();
                              stateOfSong();
                            },
                            child: RoundedButton(
                              icon: Icons.play_arrow,
                              height: 80,
                              width: 80,
                              size: 40,
                              color: Colors.grey[300],
                            ),
                          )
                        : GestureDetector(
                            onTap: activeButton,
                            child: ActiveButton(
                              icon: Icons.pause,
                              height: 80,
                              width: 80,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                    RoundedButton(
                      icon: Icons.fast_forward,
                      height: 60,
                      width: 60,
                      size: 20,
                      color: Colors.grey[300],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
