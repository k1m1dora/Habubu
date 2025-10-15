import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart'; // Import constants

class SoundboardPage extends StatefulWidget {
  SoundboardPage({Key? key}) : super(key: key);

  @override
  _SoundboardPageState createState() => _SoundboardPageState();
}

class _SoundboardPageState extends State<SoundboardPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Preload sounds when the widget is initialized
  @override
  void initState() {
    super.initState();
    preloadSounds();
  }

  // Preload all audio files to improve performance
  void preloadSounds() async {
    await Future.wait([
      _audioPlayer.setSource(AssetSource('instruments/guitar.wav')),
      _audioPlayer.setSource(AssetSource('instruments/flute.wav')),
      _audioPlayer.setSource(AssetSource('instruments/violin.wav')),
      _audioPlayer.setSource(AssetSource('instruments/harp.wav')),
      _audioPlayer.setSource(AssetSource('instruments/bass_guitar.wav')),
      _audioPlayer.setSource(AssetSource('instruments/trumpet.wav')),
      _audioPlayer.setSource(AssetSource('instruments/drums.wav')),
      _audioPlayer.setSource(AssetSource('instruments/piano.wav')),
      _audioPlayer.setSource(AssetSource('instruments/xylophone.wav')),
      _audioPlayer.setSource(AssetSource('animals/bird.wav')),
      _audioPlayer.setSource(AssetSource('animals/cat.wav')),
      _audioPlayer.setSource(AssetSource('animals/cow.wav')),
      _audioPlayer.setSource(AssetSource('animals/dog.wav')),
      _audioPlayer.setSource(AssetSource('animals/elephant.wav')),
      _audioPlayer.setSource(AssetSource('animals/frog.wav')),
      _audioPlayer.setSource(AssetSource('animals/lion.wav')),
      _audioPlayer.setSource(AssetSource('animals/monkey.wav')),
      _audioPlayer.setSource(AssetSource('animals/snake.wav')),
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/back_button.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 130, 182, 255),
        elevation: 5.0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/base 4.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: AppBar().preferredSize.height),
                  Column(
                    children: [
                      // Music section title with updated style
                      Text(
                        'Music',
                        style: kMainTitleTextStyle, // Use the constant style
                      ),
                      const SizedBox(height: 10),
                      buildGrid(
                        context,
                        [
                          'assets/instruments/guitar.png',
                          'assets/instruments/flute.png',
                          'assets/instruments/violin.png',
                          'assets/instruments/harp.png',
                          'assets/instruments/bass_guitar.png',
                          'assets/instruments/trumpet.png',
                          'assets/instruments/drums.png',
                          'assets/instruments/piano.png',
                          'assets/instruments/xylophone.png',
                        ],
                        const Color.fromARGB(255, 255, 189, 134),
                        const Color.fromARGB(255, 176, 255, 154),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      // Animal section title with updated style
                      Text(
                        'Animal',
                        style: kMainTitleTextStyle, // Use the constant style
                      ),
                      const SizedBox(height: 10),
                      buildGrid(
                        context,
                        [
                          'assets/animals/bird.png',
                          'assets/animals/cat.png',
                          'assets/animals/cow.png',
                          'assets/animals/dog.png',
                          'assets/animals/elephant.png',
                          'assets/animals/frog.png',
                          'assets/animals/lion.png',
                          'assets/animals/monkey.png',
                          'assets/animals/snake.png',
                        ],
                        const Color.fromARGB(255, 168, 226, 255),
                        const Color.fromARGB(255, 255, 229, 147),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGrid(BuildContext context, List<String> images, Color color1, Color color2) {
    return Container(
      width: 280,
      height: 280,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final String imagePath = images[index]; // This is the correct variable
          final String soundPath = imagePath
              .replaceFirst('assets/', '') // Remove the 'assets/' prefix
              .replaceFirst('.png', '.wav'); // Change .png to .wav

          return GestureDetector(
            onTap: () {
              playSound(soundPath); // Use soundPath for playing sound
            },
            child: Container(
              decoration: BoxDecoration(
                color: index % 2 == 0 ? color1 : color2,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath, // Use imagePath for displaying images
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void playSound(String path) async {
    try {
      await _audioPlayer.stop(); // Stop any previously playing sound
      await _audioPlayer.play(AssetSource(path)); // Play the new sound
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error playing sound: $e')),
      );
    }
  }
}
