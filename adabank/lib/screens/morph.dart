import 'dart:ui'; // Required for the blur effect
import 'package:flutter/material.dart';

class GlassmorphismCard extends StatelessWidget {
  const GlassmorphismCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.jpg'), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color:
                      Colors.white.withOpacity(0.2), // Semi-transparent white
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white
                        .withOpacity(0.3), // Border color with transparency
                    width: 1.5,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Glassmorphism Card",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "This is a cool design",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
