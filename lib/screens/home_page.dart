import 'package:flutter/material.dart';
import 'sound_page.dart';
import 'soundboard_page.dart';
import 'searchword_page.dart';
import '../components/home_button.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/base 2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Welcome Text Container (Smaller text and box)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Reduced padding
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(12), // Slightly smaller border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15, // Slightly smaller shadow
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'WELCOME',
                      style: kTitleTextStyle.copyWith(
                        fontSize: 40, // Reduced font size
                        color: Colors.amber[300],
                      ),
                    ),
                  ),
                  SizedBox(height: 50), // Adjusted spacing
                  // Soundboard Button with HomeButton
                  HomeButton(
                    onTap: () {
                      print('Soundboard Button Pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SoundboardPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/Soundboard.png',
                      width: 300,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 30), // Adjusted spacing
                  // Sound Button with HomeButton
                  HomeButton(
                    onTap: () {
                      print('Sound Button Pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SoundPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/Sound.png',
                      width: 300,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 30), // Adjusted spacing
                  // Search Button with HomeButton
                  HomeButton(
                    onTap: () {
                      print('Search Button Pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WordSearchPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/Search.png',
                      width: 300,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


