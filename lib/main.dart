import 'package:camera/camera.dart';
import 'package:chatapp/Design/camerascreen.dart';
import 'package:chatapp/Pages/loginpage.dart';
import 'package:chatapp/Pages/register.dart';
import 'package:chatapp/homesecreen.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        // primaryColor: Color(0xFFA07A),
        // accentColor: Color(0xFFA07A),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
