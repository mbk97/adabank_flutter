import 'package:adabank/screens/homepage.dart';
import 'package:adabank/screens/welcome.dart';
import 'package:flutter/material.dart';

class ReusableNav extends StatefulWidget {
  const ReusableNav({super.key});

  @override
  State<ReusableNav> createState() => _ReusableNavState();
}

class _ReusableNavState extends State<ReusableNav> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<IconData> navBarIcons = [
    Icons.home,
    Icons.graphic_eq,
    Icons.wallet,
    Icons.notifications
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [const Homepage(), const WelcomePage()];
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65,
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
              padding: const EdgeInsets.only(right: 18, left: 18),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(30),
                        blurRadius: 40,
                        spreadRadius: 40),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(navBarIcons.length, (index) {
                  return IconButton(
                    iconSize: 30,
                    icon: Icon(navBarIcons[index]),
                    color: selectedIndex == index
                        ? const Color(0XFF09703E) // Highlight selected icon
                        : const Color(
                            0XFF000000), // Default color for other icons
                    onPressed: () {
                      onTapped(index); // Call to update the selected index
                    },
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 65, // Adjust this to control the floating height
            left: 0,
            right: 0, // Ensures horizontal centering
            child: Center(
              child: FloatingActionButton(
                onPressed: () {
                  // Handle the action of the center button
                },
                backgroundColor: const Color(0XFF09703E),
                elevation: 5, // Add some elevation to make it float
                child: const Icon(Icons.qr_code_scanner_rounded,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
