import 'package:chatapp/Model/Chatmodel.dart';
import 'package:chatapp/Pages/ContactPage.dart';
import 'package:chatapp/Pages/chatpage.dart';
import 'package:chatapp/Pages/statuspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    this.profile,
    this.chatmodels,
    this.sourchat,
  }) : super(key: key);
  final List<ChatModel> chatmodels;
  // final ChatModel model;
  final ChatModel sourchat;
  final ChatModel profile;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 1,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactPage()));
            },
            child: Icon(
              Icons.message,
            ),
          ),
          appBar: AppBar(
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatusPage(
                                  source: widget.sourchat,
                                )));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: SvgPicture.asset(widget.sourchat.isGroup
                        ? "images/group.svg"
                        : "images/person.svg"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "ChatApp",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                  ),
                  onPressed: () {}),
            ],
            bottom: TabBar(
              // controller: _controller,

              tabs: [
                Tab(
                  text: "Messaging",
                ),
                Tab(
                  text: "Call History",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: [
              // CameraPage(),
              // ChatPage(
              //   chatmodels: widget.chatmodels,
              //   sourchat: widget.sourchat,
              // ),
              ChatPAge(
                chatmodels: widget.chatmodels,
                sourchat: widget.sourchat,
              ),

              Text("Calls"),
            ],
          ),
        ),
      ),
    );
  }
}
