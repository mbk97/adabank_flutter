import 'package:adabank/screens/homepage.dart';
import 'package:adabank/screens/settings_page.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSelected = true;
  bool isSelectedOne = true;
  bool isSelectedTwo = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  void toggleSwitchOne(bool value) {
    setState(() {
      isSelectedOne = !isSelectedOne;
    });
  }

  void toggleSwitchTwo(bool value) {
    setState(() {
      isSelectedTwo = !isSelectedTwo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
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
                        final route = MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        );
                        Navigator.push(context, route);
                      },
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      final route = MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      );
                      Navigator.push(context, route);
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Image.asset('assets/images/profile_img.png'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Marianna S.",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  "mariannasworld@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 156,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Personal Account Information",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 0.3,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("\$Castag"),
                          Row(
                            children: [
                              const Text(
                                "\$nextarui",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                onPressed: () {
                                  print("object");
                                },
                                icon: const Icon(Icons.copy),
                                iconSize: 17,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Account Number"),
                          Row(
                            children: [
                              const Text(
                                "903402383011",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                onPressed: () {
                                  print("object");
                                },
                                icon: const Icon(Icons.copy),
                                iconSize: 17,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("General"),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/online_pay.png'),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Online Payment',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text("Unblock PIN or CVV and more")
                            ],
                          )
                        ],
                      ),
                      Switch(
                        value: isSelected,
                        onChanged: toggleSwitch,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0XFF106048),
                        inactiveTrackColor:
                            const Color.fromARGB(255, 221, 237, 232),
                        inactiveThumbColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/atm.png'),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ATM Windrawals',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text("Enable cash withdrawals")
                            ],
                          )
                        ],
                      ),
                      Switch(
                        value: isSelectedOne,
                        onChanged: toggleSwitchOne,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0XFF106048),
                        inactiveTrackColor:
                            const Color.fromARGB(255, 221, 237, 232),
                        inactiveThumbColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/pay.png'),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment Abroad',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text("Enable this card abroad")
                            ],
                          )
                        ],
                      ),
                      Switch(
                        value: isSelectedTwo,
                        onChanged: toggleSwitchTwo,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0XFF106048),
                        inactiveTrackColor:
                            const Color.fromARGB(255, 221, 237, 232),
                        inactiveThumbColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
