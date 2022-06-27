import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTpScreen extends StatefulWidget {
  const OTpScreen({Key key, this.countryCode, this.number}) : super(key: key);
  final String countryCode;
  final String number;

  @override
  _OTpScreenState createState() => _OTpScreenState();
}

class _OTpScreenState extends State<OTpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Text(
                  "Verify  " +
                      (widget.countryCode) +
                      (widget.number.toString()),
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 25,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Code will be sent in this  ",
                      style: TextStyle(fontSize: 13, color: Colors.black)),
                  TextSpan(
                      text: widget.countryCode.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: widget.number.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ])),
                SizedBox(
                  height: 15,
                ),
                Text("Enter Code"),
                OTPTextField(
                  keyboardType: TextInputType.number,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 55,
                  fieldStyle: FieldStyle.underline,
                  style: TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.message,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Resend Code",
                        style: TextStyle(
                            fontSize: 20, color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Call",
                        style: TextStyle(
                            fontSize: 20, color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
