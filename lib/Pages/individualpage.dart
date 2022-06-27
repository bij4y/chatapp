import 'dart:io';

import 'package:chatapp/CustomUi/ownmessage.dart';
import 'package:chatapp/CustomUi/replycard.dart';
import 'package:chatapp/Design/camerascreen.dart';
import 'package:chatapp/Design/cameraview.dart';

import 'package:chatapp/Model/Chatmodel.dart';
import 'package:chatapp/Model/Messagemodel.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key key, this.chatModel, this.sourchat})
      : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourchat;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final _addFormKey = GlobalKey<FormState>();

  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [];
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  IO.Socket socket;

  @override
  void initState() {
    super.initState();
    connect();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    // connect();
  }

  void connect() {
    socket = IO.io("http://192.168.18.8:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.emit("signin", widget.sourchat.id);
    socket.onConnect((data) {
      print("Connected ");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"], msg["path"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });

    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId, String path) {
    setMessage("source", message, path);
    socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "path": path
    });
  }

  void setMessage(String type, String message, String path) {
    MessageModel messageModel = MessageModel(
        path: path,
        message: message,
        type: type,
        time: DateTime.now().toString().substring(10, 16));
    setState(() {
      messages.add(messageModel);
    });
  }

  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    // final cameraFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageC() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    // final cameraFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void onImageSend(String path) {
    print("hey $path");
  }

  // void _showPicker(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return SafeArea(
  //           child: Container(
  //             child: new Wrap(
  //               children: <Widget>[
  //                 new ListTile(
  //                     leading: new Icon(Icons.photo_library),
  //                     title: new Text('Photo Library'),
  //                     onTap: () {
  //                       getImage();
  //                       Navigator.of(context).pop();
  //                     }),
  //                 new ListTile(
  //                   leading: new Icon(Icons.photo_camera),
  //                   title: new Text('Camera'),
  //                   onTap: () {
  //                     getImageC();
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   "assets/whatsapp_Back.png",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: Colors.white70,
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back,
                        size: 24, color: Theme.of(context).accentColor),
                    CircleAvatar(
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup
                            ? "images/group.svg"
                            : "images/person.svg",
                        color: Colors.white,
                        height: 36,
                        width: 36,
                      ),
                      radius: 20,
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name,
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      ),
                      Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                            fontSize: 13, color: Theme.of(context).accentColor),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.videocam,
                        color: Theme.of(context).accentColor),
                    onPressed: () {}),
                IconButton(
                    icon:
                        Icon(Icons.call, color: Theme.of(context).accentColor),
                    onPressed: () {}),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert,
                      color: Theme.of(context).accentColor),
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext contesxt) {
                    return [
                      PopupMenuItem(
                        child: Text("View Contact"),
                        value: "View Contact",
                      ),
                      PopupMenuItem(
                        child: Text("Media, links, and docs"),
                        value: "Media, links, and docs",
                      ),
                      PopupMenuItem(
                        child: Text("Whatsapp Web"),
                        value: "Whatsapp Web",
                      ),
                      PopupMenuItem(
                        child: Text("Search"),
                        value: "Search",
                      ),
                      PopupMenuItem(
                        child: Text("Mute Notification"),
                        value: "Mute Notification",
                      ),
                      PopupMenuItem(
                        child: Text("Wallpaper"),
                        value: "Wallpaper",
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          body: Form(
            key: _addFormKey,
            child: Container(
              color: Colors.grey.shade400,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WillPopScope(
                child: Column(
                  children: [
                    Expanded(
                      // height: MediaQuery.of(context).size.height - 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: messages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == messages.length) {
                            return Container(
                              height: 70,
                            );
                          }
                          if (messages[index].type == "source") {
                            return OwnMessageCard(
                              message: messages[index].message,
                              time: messages[index].time,
                            );
                          } else {
                            return ReplyCard(
                              message: messages[index].message,
                              time: messages[index].time,
                            );
                          }
                        },
                      ),
                      // child: ListView(
                      //   children: [
                      //     OwnFileScreen(
                      //       path: _image.path,
                      //     ),
                      //     ReplyFileCard()
                      //   ],
                      // ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  child: Card(
                                    margin: EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {
                                            sendButton = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendButton = false;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a message",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        prefixIcon: IconButton(
                                          icon: Icon(
                                            show
                                                ? Icons.keyboard
                                                : Icons.emoji_emotions_outlined,
                                          ),
                                          onPressed: () {
                                            if (!show) {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                            }
                                            setState(() {
                                              show = !show;
                                            });
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.attach_file),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomSheet());
                                                // getImage();
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             CameraViewPage(
                                                //               path: _image.path,
                                                //               onImageSend:
                                                //                   onImageSend,
                                                //             )));
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.camera_alt),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (builder) =>
                                                            CameraScreen(
                                                              onImageSend:
                                                                  onImageSend,
                                                            )));
                                              },
                                            ),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(5),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                    right: 2,
                                    left: 2,
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Color(0xFF128C7E),
                                    child: IconButton(
                                      icon: Icon(
                                        sendButton ? Icons.send : Icons.mic,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        if (sendButton) {
                                          _scrollController.animateTo(
                                              _scrollController
                                                  .position.maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeOut);
                                          sendMessage(
                                              _controller.text,
                                              widget.sourchat.id,
                                              widget.chatModel.id,
                                              "");
                                          _controller.clear();
                                          setState(() {
                                            sendButton = false;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            show ? emojiSelect() : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onWillPop: () {
                  if (show) {
                    setState(() {
                      show = false;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo,
                      "Document", () {}),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CameraScreen(
                                  onImageSend: onImageSend,
                                )));
                  }),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.insert_photo,
                    Colors.purple,
                    "Gallery",
                    () async {
                      getImage();
                      if (_image.path == null) {
                        SizedBox();
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraViewPage(
                                      path: _image.path,
                                      onImageSend: onImageSend,
                                    )));
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio", () {}),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                      Icons.location_pin, Colors.teal, "Location", () {}),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact", () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(
      IconData icons, Color color, String text, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        });
  }
}
