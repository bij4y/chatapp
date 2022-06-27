import 'package:chatapp/CustomUi/AvtarCard.dart';

import 'package:chatapp/Design/contactdesign.dart';
import 'package:chatapp/Model/Chatmodel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Contact"), actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(Icons.search),
        ),
      ]),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index - 1].select == false) {
                      setState(() {
                        contacts[index - 1].select = true;
                        groups.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].select = false;
                        groups.remove(contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactDesign(
                    contacts: contacts[index - 1],
                  ),
                );
              }),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].select = false;
                                    groups.remove(contacts[index]);
                                  });
                                },
                                child: AvatarCard(
                                  contacts: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
