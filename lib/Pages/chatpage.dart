import 'package:chatapp/Design/chatdesign.dart';
import 'package:chatapp/Model/Chatmodel.dart';
import 'package:flutter/material.dart';

class ChatPAge extends StatefulWidget {
  const ChatPAge({Key key, this.chatmodels, this.sourchat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;
  @override
  _ChatPAgeState createState() => _ChatPAgeState();
}

class _ChatPAgeState extends State<ChatPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.chatmodels.length,
          itemBuilder: (context, index) => ChatDesign(
                chatModel: widget.chatmodels[index],
                sourchat: widget.sourchat,
              )),
    );
  }
}
