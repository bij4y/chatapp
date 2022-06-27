import 'package:chatapp/Model/Chatmodel.dart';
import 'package:chatapp/Pages/individualpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatDesign extends StatelessWidget {
  const ChatDesign({Key key, this.chatModel, this.sourchat}) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourchat;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IndividualPage(
                          chatModel: chatModel,
                          sourchat: sourchat,
                        )));
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(chatModel.isGroup == false
                  ? "images/group.svg"
                  : "images/person.svg",color: Colors.white,),
              // child: chatModel.isGroup
              //     ? SvgPicture.asset("images/group.svg")
              //     : SvgPicture.asset("images/person.svg")),
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 5,
                ),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
