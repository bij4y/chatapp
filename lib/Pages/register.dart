import 'package:chatapp/Model/countryModel.dart';
import 'package:chatapp/newscreen/countrypage.dart';
import 'package:chatapp/newscreen/otpscreen.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _controller = TextEditingController();
  String countryname = "";
  String countrycode = "";

  void _showialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Enter valid Number"),
          content: new Text("Is this  " + _controller.text + " is valid?"),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text(
                "Edit",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: 110,
            ),
            ElevatedButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTpScreen(
                              countryCode: countrycode,
                              number: _controller.text,
                            )));
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: new Text("Please Entered Valid Number"),
          content: new Text("Please Entered Valid Number"),
          actions: <Widget>[
            SizedBox(
              width: 110,
            ),
            ElevatedButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  "Enter your Number",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Choose Country Code",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            countryCard(),
            SizedBox(
              height: 10,
            ),
            number(),
            SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.length < 10) {
                      _showDialog(context);
                    } else {
                      _showialog(context);
                    }
                  },
                  child: Text("Sign Up"),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      // padding: EdgeInsets.symmetric(
      //   vertical: 5,
      // ),
      child: Row(
        children: [
          Text(
            countrycode,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              child: Center(
                  child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter Phone Number"),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CountryPage(
                      setCountrycode: setCountrycode,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(
          vertical: 5,
        ),
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(width: 1.8))),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    countryname,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  void setCountrycode(CountryModel countryModel) {
    setState(() {
      countrycode = countryModel.code;
      countryname = countryModel.name;
    });
    Navigator.pop(context);
  }
}
