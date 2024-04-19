import 'package:flutter/material.dart';
import 'package:plane_flights/Logins/biirth.dart';
class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
      
            child: Form(
              key: _formKey,
      
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Row(
      
                    children: [
                      SizedBox(width: 7,),
                      RichText(
      
                      text: TextSpan(
                        style: TextStyle(fontSize: 30),
                        children: [
                          TextSpan(
                            text: 'Enter ',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'First ',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '& \n',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Last Name ',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ],
                  ),
      
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: _firstName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your First Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "First Name",
                      filled: true,
                      fillColor: Colors.white,
                      // prefixIcon: Icon(
                      //   Icons.email,
                      //   color: Color(0xff3C6255),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
      
      
                      ),
      
                    ),
                  ),
              SizedBox(height: 12,),
                  TextFormField(
                    controller: _lastName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Last Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      filled: true,
                      fillColor: Colors.white,
                      // prefixIcon: Icon(
                      //   Icons.email,
                      //   color: Color(0xff3C6255),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
      
      
                      ),
      
                    ),
                  ),
                  SizedBox(height: 120),
      
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BirthDate()),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(150, 15, 150, 15),
                        child: Text(
                          '  Next  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
