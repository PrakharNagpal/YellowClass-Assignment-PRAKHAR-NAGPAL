import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yellowclass/model/video_model.dart';

Future<List<VideoModel>> initData() async {
  var data1 = await rootBundle.loadString('assets/data/data.json');
  var data = data1.toString();
  var d = jsonDecode(data);
  List<VideoModel> videoList = [];
  for (var el in d) {
    VideoModel v = VideoModel.fromMap(el);
    videoList.add(v);
  }
  return videoList;
}
