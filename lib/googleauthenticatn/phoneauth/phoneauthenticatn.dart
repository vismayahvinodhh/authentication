
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otpinputpage.dart';

class Phone_login extends StatefulWidget {
  const Phone_login({super.key});

  @override
  State<Phone_login> createState() => _Phone_loginState();
}

class _Phone_loginState extends State<Phone_login> {
  final formkey=GlobalKey<FormState>();//for validations
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(key: formkey,
            child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextFormField(validator: (value) {
                          if(value!.isEmpty){
                            return "Invalid credentials";
                          }
                        },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: ("Enter Your Mobile number "),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: Colors.white,
                              filled: true),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate());
                          {
                            print("Login succesfully");
                          }
                        },
                        child: InkWell(
                          onTap:  () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Inputpageotp();
                            },));
                          },
                          child: Text(
                            "Login through otp",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),

                    ],
                  ),
                ] ),
          ),
        ));
  }
}