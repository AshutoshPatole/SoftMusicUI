import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/Screens/SongsList.dart';
import 'package:rxdart/subjects.dart';

class MusicInfo {
  BehaviorSubject<List<SongsList>> _songs;
  BehaviorSubject<List<SongInfo>> _songsInfo;
  BehaviorSubject<List<AlbumInfo>> _albums;
  BehaviorSubject<Duration> _songDuration;
  BehaviorSubject<bool> _isAudioSeeking;
  BehaviorSubject<MapEntry<AudioPlayerState, SongInfo>> _playerState;

  FlutterAudioQuery _audioQuery;
  AudioPlayer _audioPlayer;

  BehaviorSubject<List<SongsList>> get songs$ => _songs;
  BehaviorSubject<List<AlbumInfo>> get albums$ => _albums;
  BehaviorSubject<MapEntry<AudioPlayerState, SongInfo>> get playerState$ =>
      _playerState;

  Future<void> fetchAllSongs() async {
    _audioQuery.getSongs().then((value) => _songsInfo.add(value));
  }

  void playSong(SongInfo song) {
    _audioPlayer.play(song.filePath);
    updatePlayerState(AudioPlayerState.PLAYING, song);
  }

  void pauseSong(SongInfo song) {
    _audioPlayer.pause();
    updatePlayerState(AudioPlayerState.PAUSED, song);
  }

  void stopMusic() {
    _audioPlayer.stop();
  }

  void audioSeek(double seconds) {
    // TODO: clear this audioplayer.seek() error;
  }

  void updatePlayerState(AudioPlayerState state, SongInfo song) {
    _playerState.add(MapEntry(state, song));
  }

  void dispose() {
    _songs.close();
    _songsInfo.close();
    _songDuration.close();
    _isAudioSeeking.close();
    _albums.close();
  }
}
