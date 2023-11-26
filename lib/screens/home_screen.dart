import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_app/models/song.dart';
import 'package:music_player_app/screens/song_screen.dart';
import 'package:music_player_app/widgets/app_bar_widget.dart';
import 'package:music_player_app/widgets/background_widget.dart';
import 'package:music_player_app/widgets/song_card_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _audioQuery = OnAudioQuery();
  final _audioPlayer = AudioPlayer();
  List<Song> songList = List.of([]);

  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    checkAndRequestPermissions();
    _init();
  }

  void _init() async {
    _audioPlayer.setLoopMode(LoopMode.all);
    
    await querySongs().then((songs) {
      songList.addAll(songs);
      setAudioSource(songs);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    _hasPermission ? setState(() {}) : null;
  }

  Future<List<Song>> querySongs() {
    return _audioQuery
        .querySongs(
            uriType: UriType.EXTERNAL,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: SongSortType.TITLE,
            ignoreCase: true)
        .then((value) {
      int index = 0;
      return value.map((model) {
        return Song(
            id: model.id,
            title: model.title,
            artist: model.artist ?? "Unknown Artist",
            data: model.data,
            track: index++);
      }).toList();
    });
  }

  void setAudioSource(List<Song> songs) {
    _audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
      ...songs.map((song) {
        return AudioSource.uri(Uri.parse(song.data));
      })
    ]));
  }

  void playSong(int track) {
    _audioPlayer.seek(
      null,
      index: track,
    );
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SongScreen(audioPlayer: _audioPlayer)));
  }

  Widget buildSongCards() {
    return Column(
      children: [
        ...songList.map((song) {
          return SongCardWidget(song: song, playSong: playSong);
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      body: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: const AppBarWidget(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              buildSongCards(),
            ],
          ),
        ),
      ),
    );
  }
}
