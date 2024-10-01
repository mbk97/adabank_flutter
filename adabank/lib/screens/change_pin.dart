import 'package:flutter/material.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  final TextEditingController _newPinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  bool _isPinMatched = true; // To check if pins match
  bool _isNewPinObscured = true; // To toggle new PIN visibility
  bool _isConfirmPinObscured = true; // To toggle confirm PIN visibility
  bool _isPinLengthValid = true; // To check if new PIN length is valid

  final int _requiredPinLength = 4; // Example PIN length (can be changed)

  @override
  void dispose() {
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  void _validatePins() {
    setState(() {
      _isPinLengthValid = _newPinController.text.length == _requiredPinLength;
      _isPinMatched = _isPinLengthValid &&
          _newPinController.text == _confirmPinController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF106048),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              "Change PIN",
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
                          "New PIN",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextField(
                          controller: _newPinController,
                          obscureText: _isNewPinObscured, // Toggle visibility
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0XFF09703E),
                          onChanged: (value) => _validatePins(),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF09703E)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0XFF09703E),
                                width: 2.0, // Green bottom border when focused
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isNewPinObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isNewPinObscured = !_isNewPinObscured;
                                });
                              },
                            ),
                            errorText: !_isPinLengthValid
                                ? "PIN must be $_requiredPinLength digits"
                                : null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Confirm PIN",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextField(
                          controller: _confirmPinController,
                          obscureText:
                              _isConfirmPinObscured, // Toggle visibility
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0XFF09703E),
                          onChanged: (value) => _validatePins(),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF09703E)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0XFF09703E),
                                width: 2.0, // Green bottom border when focused
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPinObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPinObscured =
                                      !_isConfirmPinObscured;
                                });
                              },
                            ),
                            errorText:
                                !_isPinMatched ? "Pins do not match" : null,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Spacer(), // Push the button to the bottom
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0XFF09703E),
                              ),
                              child: const Text(
                                "SAVE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
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
