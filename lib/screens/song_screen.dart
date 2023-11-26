import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key, required this.audioPlayer});

  final AudioPlayer audioPlayer;

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  Widget build(BuildContext context) {
    widget.audioPlayer.play();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (widget.audioPlayer.playing) {
                  widget.audioPlayer.stop();
                  return;
                }
                widget.audioPlayer.play();
              },
              child: const Text("Play"),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.audioPlayer.hasNext) {
                  widget.audioPlayer.seekToNext();
                }
              },
              child: const Text("Next"),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.audioPlayer.hasPrevious) {
                  widget.audioPlayer.seekToPrevious();
                }
              },
              child: const Text("Previous"),
            ),
          ],
        ),
      ),
    );
  }
}
