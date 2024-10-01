import 'package:flutter/material.dart';

class Topup extends StatefulWidget {
  const Topup({super.key});

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  dynamic selectedValue = 0;
  final TextEditingController _amountController = TextEditingController();

  void updatedValue(dynamic val) {
    setState(() {
      selectedValue = val;
      _amountController.text = val.toString(); // Update the input field
    });
  }

  void updatedAmount(String val) {
    setState(() {
      selectedValue = val; // Update selected value when user types
    });
  }

  @override
  void dispose() {
    _amountController
        .dispose(); // Dispose controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List amountRange = [
      {"id": 1, "amount": 50.000},
      {"id": 2, "amount": 75.000},
      {"id": 3, "amount": 100.000},
      {"id": 4, "amount": 150.000},
      {"id": 5, "amount": 200.000},
      {"id": 6, "amount": 250.000},
      {"id": 7, "amount": 300.000},
      {"id": 8, "amount": 400.000},
    ];

    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              "Top Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 120),
                        const Text(
                          "Total Top Up",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0XFF09703E),
                          onChanged: updatedAmount,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF09703E)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0XFF09703E),
                                width: 2.0, // Green bottom border when focused
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10, // Horizontal spacing between items
                          runSpacing: 20, // Vertical spacing between rows
                          children: amountRange.map((item) {
                            return GestureDetector(
                              onTap: () {
                                updatedValue(item["amount"]
                                    .toStringAsFixed(3)); // Update on tap
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 85,
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: Color(0XFF106048),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(
                                    item["amount"].toStringAsFixed(3),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
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
