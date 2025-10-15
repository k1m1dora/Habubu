import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onTap; // Action when the button is tapped
  final Widget child; // The content inside the button

  const HomeButton({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 5), // Shadow offset
            ),
          ],
        ),
        child: child, // Custom child widget passed by the user
      ),
    );
  }
}
