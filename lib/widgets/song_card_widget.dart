import 'package:flutter/material.dart';
import 'package:music_player_app/models/song.dart';

class SongCardWidget extends StatelessWidget {
  const SongCardWidget({
    super.key,
    required this.song,
    required this.playSong,
  });

  final Song song;
  final Function playSong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              color: Colors.transparent.withAlpha(125),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      song.artist,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    playSong(song.track);
                  },
                  icon: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
