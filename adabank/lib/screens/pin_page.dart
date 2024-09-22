import 'package:adabank/components/reusable_nav.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pin1Controller = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final TextEditingController pin3Controller = TextEditingController();
  final TextEditingController pin4Controller = TextEditingController();

  // Function to check if all fields are filled
  void _checkPinAndSubmit() {
    if (pin1Controller.text.isNotEmpty &&
        pin2Controller.text.isNotEmpty &&
        pin3Controller.text.isNotEmpty &&
        pin4Controller.text.isNotEmpty) {
      // Navigate to the next page or submit the form
      navigateToHomePage();
      // Or you can call your form submission method here
      // _submitForm();
    }
  }

  void navigateToHomePage() {
    final route = MaterialPageRoute(
      builder: (context) => const ReusableNav(),
    );
    Navigator.push(context, route);
  }

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
                  _buildPinInputField(context, pin1Controller),
                  _buildPinInputField(context, pin2Controller),
                  _buildPinInputField(context, pin3Controller),
                  _buildPinInputField(context, pin4Controller),
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

  Widget _buildPinInputField(
      BuildContext context, TextEditingController controller) {
    return Container(
      width: 55, // Desired width
      height: 59, // Desired height
      decoration: BoxDecoration(
        color: const Color(0XFF09703E), // Green background
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
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
              _checkPinAndSubmit(); // Check if all fields are filled
            }
          },
        ),
      ),
    );
  }
}
