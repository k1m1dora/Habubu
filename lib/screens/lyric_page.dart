import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../components/back_button.dart'; // Custom BackButton widget
import '../constants.dart'; // App-specific constants

class LyricPage extends StatefulWidget {
  final String? videoId;

  const LyricPage({required this.videoId, Key? key}) : super(key: key);

  @override
  _LyricPageState createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> {
  late YoutubePlayerController _controller;

// Lyrics map: videoId -> lyrics
  final Map<String, String> lyricsMap = {
    'yCjJyiqpAuU': "Twinkle Twinkle, Little Star\n"
        "How I wonder what you are\n"
        "Up above the world so high\n"
        "Like a diamond in the sky\n"
        "Twinkle Twinkle Little Star\n"
        "How I wonder what you are!",

    '_6HzoUcx3eo': "Old MacDonald had a farm, E-I-E-I-O\n"
        "And on that farm he had a pig, E-I-E-I-O\n"
        "With a oink-oink here and a oink-oink there\n"
        "Here a oink, there a oink, everywhere a oink-oink\n\n"
        "Old MacDonald had a farm, E-I-E-I-O\n"
        "And on that farm he had a duck, E-I-E-I-O\n"
        "With a quack-quack here and a quack-quack there\n"
        "Here a quack, there a quack, everywhere a quack-quack\n"
        "Oink-oink here and a oink-oink there\n"
        "Here a oink, there a oink, everywhere a oink-oink\n"
        "Old MacDonald had a farm, E-I-E-I-O\n",

    'w_lCi8U49mY': "The itsy bitsy spider climbed up the water spout,\n"
        "Down came the rain and washed the spider out.\n"
        "Out came the sun and dried up all the rain,\n"
        "And the itsy bitsy spider climbed up the spout again.\n\n"
        "The itsy bitsy spider climbed up the water spout,\n"
        "Down came the rain and washed the spider out.\n"
        "Out came the sun and dried up all the rain,\n"
        "And the itsy bitsy spider climbed up the spout again.\n",

    '7otAJa3jui8': "Row, row, row your boat, gently down the stream.\n"
        "Merrily, merrily, merrily, merrily, life is but a dream.\n"
        "Row, row, row your boat, gently down the stream.\n"
        "If you see a crocodile, don’t forget to scream!\n\n"
        "Row, row, row your boat, gently down the stream.\n"
        "Merrily, merrily, merrily, merrily, life is but a dream.\n"
        "Row, row, row your boat, gently down the stream.\n"
        "If you see a crocodile, don’t forget to scream!",

    'XqZsoesa55w': "Baby shark, doo, doo, doo, doo, doo, doo\n"
        "Baby shark, doo, doo, doo, doo, doo, doo\n"
        "Baby shark, doo, doo, doo, doo, doo, doo\n"
        "Baby shark\n\n"
        "Mommy shark, doo, doo, doo, doo, doo, doo\n"
        "Mommy shark, doo, doo, doo, doo, doo, doo\n"
        "Mommy shark, doo, doo, doo, doo, doo, doo\n"
        "Mommy shark\n\n"
        "Daddy shark, doo, doo, doo, doo, doo, doo\n"
        "Daddy shark, doo, doo, doo, doo, doo, doo\n"
        "Daddy shark, doo, doo, doo, doo, doo, doo\n"
        "Daddy shark\n\n"
        "Grandma shark, doo, doo, doo, doo, doo, doo\n"
        "Grandma shark, doo, doo, doo, doo, doo, doo\n"
        "Grandma shark, doo, doo, doo, doo, doo, doo\n"
        "Grandma shark\n\n"
        "Grandpa shark, doo, doo, doo, doo, doo, doo\n"
        "Grandpa shark, doo, doo, doo, doo, doo, doo\n"
        "Grandpa shark, doo, doo, doo, doo, doo, doo\n"
        "Grandpa shark\n\n"
        "Let's go hunt, doo, doo, doo, doo, doo, doo\n"
        "Let's go hunt, doo, doo, doo, doo, doo, doo\n"
        "Let's go hunt, doo, doo, doo, doo, doo, doo\n"
        "Let's go hunt\n\n"
        "Run away, doo, doo, doo, doo, doo, doo\n"
        "Run away, doo, doo, doo, doo, doo, doo\n"
        "Run away, doo, doo, doo, doo, doo, doo\n"
        "Run away\n\n"
        "Safe at last, doo, doo, doo, doo, doo, doo\n"
        "Safe at last, doo, doo, doo, doo, doo, doo\n"
        "Safe at last, doo, doo, doo, doo, doo, doo\n"
        "Safe at last\n\n"
        "It's the end, doo, doo, doo, doo, doo, doo\n"
        "It's the end, doo, doo, doo, doo, doo, doo\n"
        "It's the end, doo, doo, doo, doo, doo, doo\n"
        "It's the end",
  };


  @override
  void initState() {
    super.initState();

    // Initialize the YouTube player controller
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch lyrics using videoId, fallback to default if not found
    final lyrics = lyricsMap[widget.videoId] ??
        'No lyrics available for this video.';

    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        backgroundColor: kAppBarBackground,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/base 3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main Content
          Column(
            children: [
              const SizedBox(height: 20),

              // YouTube Player
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
              const SizedBox(height: 16),

              // Scrollable Lyrics
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      lyrics,
                      style: const TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
