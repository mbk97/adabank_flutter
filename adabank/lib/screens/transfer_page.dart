import 'package:adabank/screens/transfer_detail.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final List<Map<String, String>> contacts = [
    {
      "name": "Ojaman",
      "bank": "Bank - 0987 3422 8756",
      "image": 'assets/images/ojaman.png'
    },
    {
      "name": "Mariana",
      "bank": "Bank - 0987 3422 8756",
      "image": 'assets/images/mariana.png'
    },
    {
      "name": "Jumin",
      "bank": "Bank - 0987 3422 8756",
      "image": 'assets/images/jumin.png'
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredContacts = contacts.where((contact) {
      return contact['name']!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF09703E),
                    size: 24.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Text(
                "Transfer",
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 70),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Bank Account",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ]),
              Column(children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Color(0XFF88b0a4),
                    shape: BoxShape.circle,
                  ),
                ),
                const Text(
                  "Scan",
                  style: TextStyle(
                      color: Color(0XFF88b0a4), fontWeight: FontWeight.w600),
                )
              ]),
              Column(children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Color(0XFF88b0a4),
                    shape: BoxShape.circle,
                  ),
                ),
                const Text(
                  "Near By",
                  style: TextStyle(
                      color: Color(0XFF88b0a4), fontWeight: FontWeight.w600),
                )
              ]),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 600,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0XFFf6f6f6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  TextFormField(
                    cursorColor: const Color(0xFF39605B),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_sharp,
                        size: 30,
                      ),
                      hintText: "Search Contact",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value; // Update search query
                      });
                    },
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Recent Contacts',
                    style: TextStyle(
                        color: Color(0XFF7f7d8c), fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: 170,
                    child: filteredContacts.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: filteredContacts.length,
                            itemBuilder: (context, index) {
                              final contact = filteredContacts[index];
                              return Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                      builder: (context) => TransferDetail(
                                        id: index.toString(),
                                        name: contact['name'].toString(),
                                        image: contact['image'].toString(),
                                      ),
                                    );
                                    Navigator.push(context, route);
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(contact['image']!),
                                      const SizedBox(height: 10),
                                      Text(
                                        contact['name']!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        contact['bank']!,
                                        style: const TextStyle(
                                          color: Color(0XFF7f7d8c),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Text("Contact not found"),
                  ),
                  Container(
                    height: 0.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  const SizedBox(height: 25),
                  Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: const Text("All Contacts")),
                  const SizedBox(height: 25),
                  SizedBox(
                    height:
                        250, // Ensure the height is appropriate for the items
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = filteredContacts[index];
                        return Container(
                          padding: const EdgeInsets.only(left: 25),
                          margin: const EdgeInsets.only(
                              right: 20,
                              bottom: 20), // Add space under each item
                          child: Row(
                            children: [
                              Image.asset(contact['image']!),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contact['name']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    contact['bank']!,
                                    style: const TextStyle(
                                      color: Color(0XFF7f7d8c),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
