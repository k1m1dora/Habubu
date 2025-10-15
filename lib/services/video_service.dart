import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoService {
  static YoutubePlayerController createYoutubeController(String videoId) {
    return YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,  // Explicitly disable captions
      ),
    );
  }
}