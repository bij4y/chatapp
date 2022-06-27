import 'package:flutter/material.dart';

class BottomCArd extends StatelessWidget {
  const BottomCArd({Key key, this.name, this.icon}) : super(key: key);
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 25,
          child: Icon(
            icon,
            color: Colors.white,
          )),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
