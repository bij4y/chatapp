import 'package:chatapp/CustomUi/buttomcard.dart';
import 'package:chatapp/Design/contactdesign.dart';
import 'package:chatapp/Model/Chatmodel.dart';
import 'package:chatapp/Pages/creategroup.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<ChatModel> contacts = [
    ChatModel(name: "Ajay", status: "Hello? I'm Active now"),
    ChatModel(name: "Jenish", status: "Contact me"),
    ChatModel(name: "Acharya", status: "Enjoy "),
    ChatModel(name: "Ajay", status: "Hello? I'm Active now"),
    ChatModel(name: "Jenish", status: "Contact me"),
    ChatModel(name: "Acharya", status: "Enjoy "),
    ChatModel(name: "Ajay", status: "Hello? I'm Active now"),
    ChatModel(name: "Jenish", status: "Contact me"),
    ChatModel(name: "Acharya", status: "Enjoy "),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contacts"), actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.search),
          ),
        ]),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateGroup()));
                  },
                  child: BottomCArd(
                    icon: Icons.group,
                    name: "Create a New Group",
                  ),
                );
              } else if (index == 1) {
                return BottomCArd(
                  icon: Icons.person_add,
                  name: "New Contact",
                );
              } else {
                return ContactDesign(
                  contacts: contacts[index - 2],
                );
              }
            }));
  }
}
