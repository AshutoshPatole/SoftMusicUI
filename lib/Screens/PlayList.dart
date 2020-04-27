import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/Screens/SongsList.dart';
import 'package:musicplayer/Widgets/CustomDivider.dart';
import 'package:musicplayer/Widgets/PlayListHeader.dart';
import 'package:musicplayer/Widgets/ShortPlay.dart';

class PlayList extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            PlayListHeader(),
            CustomDivider(),
//            FavouriteCard(),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.735,
              child: SongsList(),
            ),
            CustomDivider(),
            ShortPlay(),
          ],
        ),
      ),
    );
  }
}
