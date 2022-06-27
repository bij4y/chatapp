import 'package:chatapp/Model/Chatmodel.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key key, this.source}) : super(key: key);
  final ChatModel source;

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("images/robot.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 100,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
