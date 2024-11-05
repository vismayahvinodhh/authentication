import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Loginauth.dart';

class User_sign_up extends StatefulWidget {
  const User_sign_up({super.key});

  @override
  State<User_sign_up> createState() => _User_sign_upState();
}

class _User_sign_upState extends State<User_sign_up> {
  final formKey = GlobalKey<FormState>();
  /* var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phonenumber = TextEditingController();
  var passwordController = TextEditingController();*/
  String name = "";
  String email = "";
  String phonenumber = "";
  String password = "";
  bool _obscurePassword = true;


  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;


  void registerUser() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await _firestore
            .collection('CrudUser')
            .doc(userCredential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'phone_number':phonenumber,
        });

        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Loginpage();
          },
        ));
      } catch (e) {
        print("Registration Error: $e");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'User Name',
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(onChanged: (value) => name=value,
                          decoration: InputDecoration(
                            labelText: 'Enter your name',
                            hintText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              'Email',
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(onChanged: (value) =>email=value,
                          decoration: InputDecoration(
                            labelText: 'Enter your email',
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(onChanged: (value) =>phonenumber=value,
                          decoration: InputDecoration(
                            labelText: 'Enter your phone number',
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              'Password',
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(onChanged: (value) =>password=value,
                          decoration: InputDecoration(
                            labelText: 'Enter your password',
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: registerUser,
                  child: Container(
                    height: 40.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue.shade900,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '    Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25.sp,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Log in",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
