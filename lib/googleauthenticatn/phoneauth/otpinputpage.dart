import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Inputpageotp extends StatefulWidget {
  const Inputpageotp({super.key});

  @override
  State<Inputpageotp> createState() => _InputpageotpState();
}

class _InputpageotpState extends State<Inputpageotp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enter OTP'),
        ),
        body: Center(
            child: Pinput(
          length: 4,
          onCompleted: (pin) => print(
              'Completed: $pin'), // Callback for when the input is completed ), ), ),
        )));
  }
}
