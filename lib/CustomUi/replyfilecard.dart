import 'package:flutter/material.dart';

class ReplyFileCard extends StatelessWidget {
  const ReplyFileCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.4,
          height: MediaQuery.of(context).size.height / 2.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          child: Card(
            margin: EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
