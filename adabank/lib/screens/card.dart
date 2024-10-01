import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool isSelected = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List data = [
      {"id": 1, "menu": "Lock Card", "image": "assets/images/lock.png"},
      {"id": 2, "menu": "Change Pin", "image": "assets/images/pin.png"},
      {"id": 3, "menu": "Top Up", "image": "assets/images/pin.png"},
    ];

    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              "My Card",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 170),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 650,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: data.map((item) {
                          return Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.only(top: 10),
                            width: 94,
                            height: 94,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.2), // Grey shadow with reduced opacity
                                  blurRadius: 10, // Blur effect
                                  spreadRadius: 2, // Spread of the shadow
                                  offset: const Offset(
                                      0, 4), // Position of the shadow (x, y)
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(item["image"]),
                                const SizedBox(height: 5),
                                Text(item['menu']),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: const Text(
                          "Settings",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Set Card Limit",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "You set budget for 3 categories",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              // Text("hello")
                              Switch(
                                  value: isSelected,
                                  onChanged: toggleSwitch,
                                  activeColor: Colors.white,
                                  activeTrackColor: const Color(0XFF106048),
                                  inactiveTrackColor: const Color(0XFF106048),
                                  inactiveThumbColor: Colors.white)
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 0.3,
                            color: Colors.black,
                            width: double.infinity,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Set Card Limit",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "You set budget for 3 categories",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Text(
                                "\$100",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 0.3,
                            color: Colors.black,
                            width: double.infinity,
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: -140, // Adjust to position the image over the container
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/card.png',
                    // height: 100, // Set height or adjust based on your image
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
