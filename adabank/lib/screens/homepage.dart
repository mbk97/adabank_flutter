import 'package:adabank/screens/profile_page.dart';
import 'package:adabank/screens/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, String>> items = [
    {"image": 'assets/images/trf_img.png', "label": "Transfer"},
    {"image": 'assets/images/top_up.png', "label": "Top-up"},
    {"image": 'assets/images/bill.png', "label": "Bill"},
    {"image": 'assets/images/more_img.png', "label": "More"},
  ];

  final List<Map<String, String>> itemsTwo = [
    {"image": 'assets/images/ojaman.png', "label": "Ojaman"},
    {"image": 'assets/images/mariana.png', "label": "Mariana"},
    {"image": 'assets/images/jimanti.png', "label": "Jimanti"},
    {"image": 'assets/images/jumin.png', "label": "Jumin"},
  ];

  final List<Map<String, String>> itemsTableData = [
    {
      "image": 'assets/images/equip.png',
      "title": "Equipment",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa"
    },
    {
      "image": 'assets/images/ent.png',
      "title": "Entertainment",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa"
    },
    {
      "image": 'assets/images/stream.png',
      "title": "Streaming",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa"
    },
    {
      "image": 'assets/images/food.png',
      "title": "Food",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa"
    },
    {
      "image": 'assets/images/shop.png',
      "title": "Shoping",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa"
    },
    {
      "image": 'assets/images/travel.png',
      "title": "Travel",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa"
    },
  ];

  final List<IconData> navBarIcons = [
    Icons.home,
    Icons.graphic_eq,
    Icons.wallet,
    Icons.notifications
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF09703E),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Mariana S.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        final route = MaterialPageRoute(
                          builder: (context) => const Profile(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Image.asset(
                        'assets/images/user_img.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 280,
                  width: 327,
                  child: GlassFlexContainer(
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 50),
                              const Center(
                                child: GlassText(
                                  "Total Balance",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0XFFadc9c1)),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.visibility,
                                  color: Color(0XFFadc9c1),
                                ),
                                onPressed: () {
                                  print('hello');
                                },
                              ),
                            ],
                          ),
                          const Center(
                            child: Text(
                              "\$450,49",
                              style: TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            color: const Color(0XFFadc9c1),
                            height: 0.7,
                            width: double.infinity,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: items.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  if (item['label'] == "Transfer") {
                                    final route = MaterialPageRoute(
                                      builder: (context) =>
                                          const TransferPage(),
                                    );
                                    Navigator.push(context, route);
                                  }
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      item['image']!,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item['label']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0XFFFFFFFF),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4, // Initial size of the draggable sheet
            minChildSize: 0.4, // Minimum size of the sheet
            maxChildSize: 0.9, // Maximum size of the sheet
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Send Again',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFbebdc4)),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: itemsTwo.map((item) {
                            return Column(
                              children: [
                                Image.asset(
                                  item['image']!,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item['label']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0XFF000000),
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Transaction History",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0XFFbebdc4),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: itemsTableData.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          item['image']!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['title']!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            item['date']!,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item['price']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        item['description']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
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
                children: navBarIcons.map((icon) {
                  return IconButton(
                    iconSize: 30,
                    icon: Icon(icon),
                    color: const Color(0XFF000000),
                    onPressed: () {
                      // Handle the onPressed for each icon
                    },
                  );
                }).toList(),
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
