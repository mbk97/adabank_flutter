import 'package:adabank/screens/receipt.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

class TransferDetail extends StatefulWidget {
  final String id;
  final String name;
  final String image;

  const TransferDetail({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<TransferDetail> createState() => _TransferDetailState();
}

class _TransferDetailState extends State<TransferDetail> {
  double swipeOffset = 0.0; // Track swipe offset
  final double swipeThreshold = 200.0; // Swipe threshold for payment completion
  final double successThreshold; // 90% of the swipe threshold

  _TransferDetailState()
      : successThreshold = 0.9 * 200.0; // Calculate 90% of threshold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: SingleChildScrollView(
        child: Column(
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 70),
              ],
            ),
            const SizedBox(height: 40), // Space below the Row

            Container(
              height: 291,
              margin: const EdgeInsets.all(20),
              child: GlassFlexContainer(
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Center(
                        child: GlassText(
                          "Enter Amount",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0XFFadc9c1),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "\$450.49",
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Container(
                        color: const Color(0XFFadc9c1),
                        height: 0.7,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.4,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(widget.image),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  widget.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Text(
                                  "Bank - 9388439947",
                                  style: TextStyle(color: Color(0XFF95b8ad)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Container for details
            Container(
              width: double.infinity,
              height: 500,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0XFFf6f6f6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text(
                  //   "Details",
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        swipeOffset +=
                            details.delta.dx; // Update the swipe offset
                        if (swipeOffset < 0)
                          swipeOffset = 0; // Prevent negative offset
                        if (swipeOffset > successThreshold) {
                          // If swiped beyond 90% of threshold, handle payment
                          _showPaymentSuccess();
                        }
                      });
                    },
                    onPanEnd: (details) {
                      if (swipeOffset < swipeThreshold) {
                        // Reset swipe if it’s not complete
                        setState(() {
                          swipeOffset = 0.0;
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0XFF106048),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                            child: Text(
                              "SWIPE TO PAY",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          left: swipeOffset,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.arrow_forward,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Payment Successful"),
          content: const Text("Your payment has been processed."),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
                setState(() {
                  swipeOffset = 0.0; // Reset swipe offset after payment
                });
                final route = MaterialPageRoute(
                  builder: (context) => const Receipt(),
                );
                Navigator.push(context, route);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
