import 'dart:io';

import 'package:flutter/material.dart';

class OwnFileScreen extends StatelessWidget {
  const OwnFileScreen({Key key, this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
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
              color: Theme.of(context).accentColor),
          child: Card(
            margin: EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.file(File(path)),
          ),
        ),
      ),
    );
  }
}
