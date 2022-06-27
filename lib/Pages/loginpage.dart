import 'package:chatapp/CustomUi/buttomcard.dart';
import 'package:chatapp/Model/Chatmodel.dart';

import 'package:chatapp/homesecreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel sourceChat;
  ChatModel profile;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Ajay",
      icon: "person.svg",
      time: "10:14",
      currentMessage: "Hlo budi",
      isGroup: false,
      id: 1,
    ),
    ChatModel(
      name: "hello",
      icon: "person.svg",
      time: "07:14",
      currentMessage: "k xa ",
      isGroup: false,
      id: 2,
    ),
    ChatModel(
      name: "3k",
      icon: "person.svg",
      time: "5:21",
      currentMessage: "moktrokopgkrdp",
      isGroup: false,
      id: 3,
    ),
    ChatModel(
      name: "I love You",
      icon: "person.svg",
      time: "5:21",
      currentMessage: "hya you idiot",
      isGroup: false,
      id: 4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  sourceChat = chatmodels.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                chatmodels: chatmodels,
                                sourchat: sourceChat,
                              )));
                },
                child: BottomCArd(
                  name: chatmodels[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}
