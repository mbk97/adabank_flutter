import 'package:flutter/material.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Verification Code",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 229,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "We have sent the code verification to your mobile number. ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Wrong number?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0XFF09703E),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space before PIN input
              Container(
                height: 22,
                width: 156,
                decoration: BoxDecoration(
                  color: const Color(0XFF09703E), // Green background
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: const Center(
                    child: Text(
                  "+6289617923533",
                  style: TextStyle(color: Color(0XFFFFFFFF)),
                )),
              ),
              const SizedBox(height: 40), // Space before PIN input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPinInputField(context),
                  _buildPinInputField(context),
                  _buildPinInputField(context),
                  _buildPinInputField(context),
                ],
              ),
              const SizedBox(height: 20), // Add more space after the PIN input
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Resend Code in 00:48",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinInputField(BuildContext context) {
    return Container(
      width: 55, // Desired width
      height: 59, // Desired height
      decoration: BoxDecoration(
        color: const Color(0XFF09703E), // Green background
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Center(
        child: TextFormField(
          cursorColor: const Color(0XFFFFFFFF),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: '', // Removes the character counter
            border: InputBorder.none, // Removes default borders
          ),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white, // White text color inside the green background
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus(); // Move to next field
            }
          },
        ),
      ),
    );
  }
}
