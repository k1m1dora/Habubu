import 'package:flutter/material.dart';
import 'lyric_page.dart'; // Import LyricPage
import '../videos.dart'; // Import video list
import '../components/back_button.dart'; // Import the BackButtonWidget component
import '../constants.dart'; // Import the constants file
class SoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        backgroundColor: kAppBarBackground,
        elevation: 5.0,
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
          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  videos.length,
                      (index) {
                    return Column(
                      children: [
                        _buildButton(
                          context,
                          'assets/button ${index + 1}.jpg',
                          videos[index]['title'] ?? 'Unknown Title',
                          videos[index]['artist'] ?? 'Unknown Artist',
                          _getButtonColor(index),
                          videos[index]['id'] ?? '',
                        ),
                        const SizedBox(height: 60),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context,
      String imagePath,
      String label,
      String artistName,
      Color backgroundColor,
      String videoId,
      ) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LyricPage(videoId: videoId), // Pass videoId to LyricPage
          ),
        );
      },
      child: Container(
        height: 150,
        width: 350,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image with rounded corners and white border
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Text on the right
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    artistName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(int index) {
    switch (index) {
      case 0:
        return kPink;
      case 1:
        return kOrange;
      case 2:
        return kYellow;
      case 3:
        return kGreen;
      case 4:
        return kBlue;
      default:
        return Colors.grey;
    }
  }
}