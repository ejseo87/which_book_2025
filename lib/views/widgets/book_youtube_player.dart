import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BookYoutubePlayer extends StatefulWidget {
  final String id;
  final String title;
  const BookYoutubePlayer({super.key, required this.id, required this.title});

  @override
  State<BookYoutubePlayer> createState() => _BookYoutubePlayerState();
}

class _BookYoutubePlayerState extends State<BookYoutubePlayer> {
  late final YoutubePlayerController _controller;
  String _id = "";
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  final bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _id = widget.id;
    _controller = YoutubePlayerController(
      initialVideoId: _id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        disableDragSeek: false,
      ),
    )..addListener(listener);

    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 5),
        Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
