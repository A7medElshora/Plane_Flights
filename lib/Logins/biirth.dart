import 'package:flutter/material.dart';
import 'package:plane_flights/Logins/OTP.dart';

class BirthDate extends StatefulWidget {
  const BirthDate({Key? key}) : super(key: key);

  @override
  State<BirthDate> createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = null; // Initialize _selectedDate with null
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // Use current date if _selectedDate is null
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 35,),
            Row(
              children: [
                SizedBox(width: 7,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 30),
                    children: [
                      TextSpan(
                        text: 'Select your\n',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'date of birth',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${_selectedDate?.day ?? DateTime.now().day}/${_selectedDate?.month ?? DateTime.now().month}/${_selectedDate?.year ?? DateTime.now().year}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 100,),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OTPVerification()),
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
    );
  }
}
