import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the column vertically
        children: [
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              'assets/images/wallet_img.png',
              fit: BoxFit
                  .contain, // You can adjust this to suit your layout needs
            ),
          ),
          const SizedBox(height: 80),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(23),
            height: 322,
            decoration: const BoxDecoration(
              color: Color(0XFFF6F6F6),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Start payments easily in the digital age",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                const Text(
                  "Payment tool that is easy and fast to use in this easy-to-use digital era. Use the features that make your business easier",
                  style: TextStyle(fontSize: 14, color: Color(0XFF080422)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 52),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFF09703E)),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFffffff),
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
