import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/Animations/Delayed_animation.dart';
import 'package:musicplayer/Screens/HomePage.dart';
import 'package:musicplayer/Widgets/CustomDivider.dart';

class SongsList extends StatefulWidget {
  @override
  _SongsListState createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<ArtistInfo> artists;
  List<SongInfo> songs;
  Future generateArtistsList;
  Future songsInfo;

  Future generateArtistList() async {
    List<ArtistInfo> temp =
        await audioQuery.getArtists();
//    artists.forEach((artist) {
//      print(artist);
//    });
    setState(() {
      artists = temp;
    });
  }

  Future getSongsList() async {
    songs = await audioQuery.getSongs(sortType: SongSortType.ALPHABETIC_ALBUM);
//    songs.forEach((song) {
//      print(song.title);
//    });
  }

  @override
  void initState() {
    getSongsList();

    songsInfo = getSongsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 200,
      child: FutureBuilder(
        future: songsInfo,
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            itemExtent: 60,
            scrollDirection: Axis.vertical,
            itemCount: songs?.length ?? 0,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  String songName = songs[index].title;
                  String singerName = songs[index].artist;
                  String filePath = songs[index].filePath;
                  String songArtWork = songs[index].albumArtwork;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        songName: songName,
                        singerName: singerName,
                        filePath: filePath,
                        songArtWork: songArtWork,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DelayedAnimation(
                          delay: 100,
                          child: AutoSizeText(
                            songs[index].title,
                            maxFontSize: 16,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                    CustomDivider()
//                      isPlaying
//                          ? GestureDetector(
//                              onTap: () {
//                                pauseAudio();
//                                isPlaying = false;
//                              },
//                              child: ActiveButton(
//                                icon: Icons.pause,
//                                width: 40,
//                                height: 40,
//                                size: 20,
//                                color: Colors.white,
//                              ),
//                            )
//                          : GestureDetector(
//                              onTap: () {
//                                playAudioFromLocalStorage(
//                                    songs[index].filePath);
//                                isPlaying = true;
//                              },
//                              child: RoundedButton(
//                                icon: Icons.play_arrow,
//                                width: 40,
//                                height: 40,
//                                size: 20,
//                                color: Colors.white70,
//                              ),
//                            )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
