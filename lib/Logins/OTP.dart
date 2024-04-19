import 'package:flutter/material.dart';
import 'package:plane_flights/Screens/HomePage.dart';
import 'package:plane_flights/Screens/Nav.dart';

class OTPVerification extends StatefulWidget {
  static const routeName = "/otp-verification";
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _isCodeCorrect() {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: OverflowBar(
              overflowSpacing: 10,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 30),
                    children: [
                      TextSpan(
                        text: 'Enter the\n',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'confirmation code',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    5,
                        (index) => SizedBox(
                      height: 80,
                      width: 60,
                      child: TextField(
                        controller: controllers[index],
                        autofocus: index == 0,
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 4) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        showCursor: true,
                        readOnly: false,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counter: const Offstage(),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28),
                // Verify Button
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 57,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      if (_isCodeCorrect()) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return BottomNavScreen();
                          }),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Error",style: TextStyle(color: Colors.red),),
                            content: Text("The code is incorrect. Please fill all the boxes."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
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
