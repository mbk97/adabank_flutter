import 'package:adabank/components/reusable_nav.dart';
import 'package:flutter/material.dart';

class SetPin extends StatelessWidget {
  const SetPin({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToHomePage() {
      final route = MaterialPageRoute(
        builder: (context) => const ReusableNav(),
      );
      Navigator.push(context, route);
    }

    return Scaffold(
      backgroundColor: const Color(0XFFF6F6F6),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Set your PIN",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
                ),
                const SizedBox(height: 8),
                const Text(
                  "You will use this to login next time",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPinInputField(context),
                    _buildPinInputField(context),
                    _buildPinInputField(context),
                    _buildPinInputField(context),
                  ],
                ),
              ],
            ),
          ),

          // Spacer pushes the button to the bottom
          Padding(
            padding: const EdgeInsets.all(
                20.0), // Add some space from the bottom edge
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity, // Button takes up full width
                height: 64,
                child: ElevatedButton(
                  onPressed: () {
                    navigateToHomePage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF09703E),
                  ),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a PIN input field
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
