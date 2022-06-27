import 'package:chatapp/Model/Chatmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key key, this.contacts}) : super(key: key);
  final ChatModel contacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                child: SvgPicture.asset(
                  "images/person.svg",
                  height: 30,
                  width: 30,
                ),
                radius: 25,
              ),
              Positioned(
                bottom: 24,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contacts.name,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
