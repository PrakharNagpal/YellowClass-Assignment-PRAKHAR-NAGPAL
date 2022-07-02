import 'package:flutter/material.dart';
import 'package:yellowclass/playlist.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 24),
            ),
          ),
          new Divider(),
          ListTile(
              leading: Icon(Icons.video_library),
              title: Text(
                "Yello Class Videos",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext) => Playlist()),
                  ))
        ],
      ),
    );
  }
}
