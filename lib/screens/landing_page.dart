import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage
import '../constants.dart'; // Import constants

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/base.png'), // Background asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Transform.scale(
                  scale: 1.8,
                  child: Image.asset(
                    'assets/Logo.png',
                  ),
                ),
                const SizedBox(height: 85),
                // App Name with kTitleTextStyle and custom color
                Text(
                  'HABUBU', // App name
                  style: kTitleTextStyle.copyWith( // Use kTitleTextStyle with overridden color
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 75),
                // Start Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to HomePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                  ),
                  child: Text(
                    'Start',
                    style: kTitleTextStyle.copyWith( // Use kTitleTextStyle with overridden color
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

