import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:plane_flights/Logins/name.dart';

class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String? _phoneNumber;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 80,),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 30),
                              children: [
                                TextSpan(
                                  text: 'Enter ',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'Phone\n',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'Number ',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              setState(() {
                                _phoneNumber = number.phoneNumber!;
                              });
                            },
                            inputDecoration: InputDecoration(
                              hintText: 'Phone number',
                              border: InputBorder.none,
                            ),
                            // hintText: 'Enter phone number',
                            countries: ['US', 'GB', 'FR', 'DE', 'IT','EG','SA','RU'], // Countries list
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey[200],
                        //     borderRadius: BorderRadius.only(
                        //       topRight: Radius.circular(5),
                        //       bottomRight: Radius.circular(5),
                        //     ),
                        //   ),
                        //   child: IconButton(
                        //     icon: Icon(Icons.arrow_drop_down),
                        //     onPressed: () {}, // Add functionality for country selection
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 100,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Name()),
                      );
                    },
                    child:Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(150, 7, 150, 7),
                        child: Text(
                          ' Next ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
