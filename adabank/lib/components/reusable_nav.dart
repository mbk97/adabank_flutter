import 'package:adabank/screens/homepage.dart';
import 'package:adabank/screens/notification_page.dart';
import 'package:adabank/screens/welcome.dart';
import 'package:flutter/material.dart';

class ReusableNav extends StatefulWidget {
  const ReusableNav({super.key});

  @override
  State<ReusableNav> createState() => _ReusableNavState();
}

class _ReusableNavState extends State<ReusableNav> {
  int selectedIndex = 0; // Ensure homepage is the default

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
    // Homepage is at index 0 to make it the default
    final List<Widget> pages = [
      const Homepage(),
      const WelcomePage(),
      const NotificationPage(),
      const NotificationPage(),
    ];

    final List<Map> first_menu = [
      {
        "title": "Send Money",
        "image": "assets/images/trf_img.png",
        "icon": Icons.arrow_forward_ios,
      },
      {
        "title": "Top-up Wallet",
        "image": "assets/images/top_up.png",
        "icon": Icons.arrow_forward_ios,
      },
      {
        "title": "Bill Payment",
        "image": "assets/images/bill.png",
        "icon": Icons.arrow_forward_ios,
      },
      {
        "title": "Code QR",
        "image": "assets/images/qr_code.png",
        "icon": Icons.arrow_forward_ios,
      },
    ];

    final List<Map> second_menu = [
      {
        "title": "History Transactions",
        "image": "assets/images/history.png",
        "icon": Icons.arrow_forward_ios,
      },
      {
        "title": "Request Payment",
        "image": "assets/images/request.png",
        "icon": Icons.arrow_forward_ios,
      },
    ];

    return Scaffold(
      drawer: Drawer(
        width: double.infinity,
        backgroundColor: const Color(0XFF106048),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 20),
              decoration: const BoxDecoration(
                color: Color(0XFF106048),
                border: Border(
                  bottom: BorderSide.none, // This removes the bottom border
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFFFFFF)),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color(0xFF09703E),
                              size: 24.0,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // navigateToHomePage();
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'Menu',
                        style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 50,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                cursorColor: const Color(0xFF39605B),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    size: 30,
                  ),
                  hintText: "Search Menu",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF7F8F9)),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF39605B)),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                // autovalidateMode: AutovalidateMode
                //     .onUserInteraction, // Enable real-time validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  // _title = value;
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shorcuts',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: first_menu.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            item['image'], // Display the image
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            item[
                                'title'], // Assuming you have a 'title' field in the map
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              // Add your button functionality here
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            // Close the drawer
                            Navigator.pop(context);

                            // Handle navigation based on the selected menu item
                            if (item['title'] == 'Send Money') {
                              onTapped(0);
                            } else if (item['title'] == 'Top-up Wallet') {
                              onTapped(1);
                            } else if (item['title'] == 'Bill Payment') {
                              onTapped(2);
                            } else if (item['title'] == 'Code QR') {
                              onTapped(3);
                            }
                          },
                        ),
                      );
                    }).toList(), // Convert the mapped items to a List of Widgets
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 1,
              color: Colors.grey,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Other Menu',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: second_menu.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            item['image'], // Display the image
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            item[
                                'title'], // Assuming you have a 'title' field in the map
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              // Add your button functionality here
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            // Close the drawer
                            Navigator.pop(context);

                            // Handle navigation based on the selected menu item
                            if (item['title'] == 'History Transactions') {
                              onTapped(0);
                            } else {
                              onTapped(1);
                            }
                          },
                        ),
                      );
                    }).toList(), // Convert the mapped items to a List of Widgets
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          pages[selectedIndex], // The page content
          // Positioning the menu button in the top left corner
          Positioned(
            top: 16, // Adjust this to provide top padding for the menu icon
            left: 16, // Adjust this to provide left padding
            child: Builder(
              builder: (context) => IconButton(
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open drawer
                },
              ),
            ),
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
                    spreadRadius: 40,
                  ),
                ],
              ),
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
                      onTapped(index); // Update the selected index
                    },
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 65, // Adjust this to control the floating button height
            left: 0,
            right: 0, // Ensures horizontal centering
            child: Center(
              child: FloatingActionButton(
                onPressed: () {
                  // Handle the action of the center button
                },
                backgroundColor: const Color(0XFF09703E),
                elevation: 5, // Add some elevation to make it float
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
