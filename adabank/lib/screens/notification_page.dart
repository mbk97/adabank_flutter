import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> transactions = [
      "Successful transaction to Ojaman, view and download the receipt",
      "Successful transaction to Ade, view and download the receipt",
      "Successful transaction to Bala, view and download the receipt",
    ];
    final List<Map> transactionsTwo = [
      {
        "icon": Icons.person,
        "textOne": "Personal Information",
        "textTwo": "complete your name and profile photo to complete the data",
      },
      {
        "icon": Icons.mail,
        "textOne": "Confirm Email",
        "textTwo":
            "Please confirm your email for further data security and completeness",
      },
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                "Notifications",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 348,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    blurRadius: 1, // Spread of the shadow
                    offset: Offset(0, 1), // Horizontal and vertical offset
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Transactions",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 0.3,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap:
                        true, // Needed to ensure the list fits in the column
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/receipt-text.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transactions[index],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "September 3",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.close,
                                size: 15,
                                color: Color(0XFF09703E),
                              ),
                            ],
                          ),
                          if (index != transactions.length - 1) ...[
                            const SizedBox(height: 20),
                            Container(
                              height: 0.3,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 20),
                          ]
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 348,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    blurRadius: 1, // Spread of the shadow
                    offset: Offset(0, 1), // Horizontal and vertical offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Complete Verification",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "60%",
                        style: TextStyle(
                          color: Color(0XFF09703E),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const LinearProgressIndicator(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    value: 0.6, // 60% progress
                    backgroundColor: Color(0XFFf2f2f4),
                    color: Color(0XFF09703E), // Color of the completed progress
                    minHeight: 10, // Height of the progress bar
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    shrinkWrap:
                        true, // Needed to ensure the list fits in the column
                    itemCount: transactionsTwo.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                transactionsTwo[index]['icon'],
                                color: const Color(0XFF09703E),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transactionsTwo[index]["textOne"]!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      transactionsTwo[index]["textTwo"]!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Color(0XFF09703E),
                              ),
                            ],
                          ),
                          if (index != transactionsTwo.length - 1) ...[
                            const SizedBox(height: 20),
                            Container(
                              height: 0.3,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 20),
                          ]
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
