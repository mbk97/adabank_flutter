import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSelected = true;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  final List<Map> first_menu = [
    {
      "title": "Change PIN",
      "image": "assets/images/change_pin.png",
      "icon": Icons.arrow_forward_ios,
    },
    {
      "title": "Change Password",
      "image": "assets/images/change_password.png",
      "icon": Icons.arrow_forward_ios,
    },
    {
      "title": "Change Fingerprint",
      "image": "assets/images/change_fingerprint.png",
      "icon": Icons.arrow_forward_ios,
    },
    {
      "title": "Turn Off Card",
      "image": "assets/images/turn_off_card.png",
      "icon": Icons.arrow_forward_ios,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
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
                  'Settings',
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
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Security',
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
                        trailing: item['title'] != "Turn Off Card"
                            ? IconButton(
                                onPressed: () {
                                  // Add your button functionality here
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Switch(
                                  value: isSelected,
                                  onChanged: toggleSwitch,
                                  activeColor: Colors.white,
                                  activeTrackColor: const Color(0XFF40806d),
                                  inactiveTrackColor: const Color(0XFF40806d),
                                  inactiveThumbColor: Colors.white,
                                ),
                              ),
                        onTap: () {
                          // Close the drawer
                          Navigator.pop(context);
                        },
                      ),
                    );
                  }).toList(), // Convert the mapped items to a List of Widgets
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
