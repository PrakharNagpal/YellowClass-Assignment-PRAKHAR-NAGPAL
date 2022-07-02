import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:yellowclass/MyDrawer.dart';
import 'package:yellowclass/helper_methods/video_data.dart';
import 'package:yellowclass/model/video_model.dart';

class Playlist extends StatefulWidget {
  //const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  int _selectedItem = 0;
  ScrollController? _scrollcontroller;
  List<VideoPlayerController>? _controllerList = <VideoPlayerController>[];
  List<Future<void>>? _initializeVideoPlayerFuture = [];

  initalizeVideoControllers() async {
    List<VideoModel> videoList = await initData();
    for (var i = 0; i <= videoList.length - 1; i++) {
      var con = VideoPlayerController.network(videoList[i].videoUrl,
          formatHint: VideoFormat.hls);
      _controllerList!.add(con);
      var init = _controllerList![i].initialize();
      _initializeVideoPlayerFuture!.add(init);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initalizeVideoControllers();
    _scrollcontroller = ScrollController();
    _scrollcontroller!.addListener(listenController);

    super.initState();
  }

  listenController() {
    setState(() {
      _selectedItem = (_scrollcontroller!.offset / 300).round();
      print(_selectedItem);
      _controllerList!.forEach((element) {
        element.pause();
      });
      _controllerList![_selectedItem].play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Yellow Class"),
      ),
      // ignore: unnecessary_new
      body: Container(
          child: FutureBuilder<List<VideoModel>>(
        future: initData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                controller: _scrollcontroller,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var video = snapshot.data![index];
                  return index == _selectedItem
                      ? FutureBuilder(
                          future: _initializeVideoPlayerFuture![index],
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: AspectRatio(
                                    aspectRatio: _controllerList![index]
                                        .value
                                        .aspectRatio,
                                    child: VideoPlayer(_controllerList![index]),
                                  ));
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          })
                      : Container(
                          height: 300,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(video.coverPicture),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              video.title,
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        );
                },
              ),
            );
          }
          return Container();
        },
      )),
    );
  }
}
