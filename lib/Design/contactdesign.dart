import 'package:chatapp/Model/Chatmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactDesign extends StatelessWidget {
  const ContactDesign({Key key, this.contacts}) : super(key: key);
  final ChatModel contacts;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              child: SvgPicture.asset("images/person.svg", color: Colors.white),
            )
          ],
        ),
        title: Text(
          contacts.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contacts.status),
        trailing: contacts.select
            ? CircleAvatar(child: Icon(Icons.check))
            : SizedBox());
  }
}
