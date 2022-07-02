import 'package:flutter/material.dart';
import 'package:yellowclass/MyDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        title: 'Yellow Class Assignment',
        home: Scaffold(
          drawer: MyDrawer(),
          body: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Image.asset(
                    'assets/images/arrow.png',
                    scale: 10,
                  ),
                ),
              ),
              Text(
                "Click on the drawer button to go to the Playlist",
                style: TextStyle(
                    color: Color.fromARGB(255, 70, 64, 2), fontSize: 18),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 200),
                  child: Text(
                    "Hey Guys! \nPresenting you an app for your recorded sessions @ Yellow Class",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 3, 34, 112),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          appBar: AppBar(title: Text("Yellow Class Assignment")),
        ));
  }
}
