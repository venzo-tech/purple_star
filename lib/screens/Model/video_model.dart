

import 'package:flutter/material.dart';

class VideoModel{
  const VideoModel({required this.title,required this.URL});
  final String title;
  final String URL;

}

const List<VideoModel> videoModel = <VideoModel>[
 VideoModel(title: 'Jack herer budder by kings garden | Before you DAB', URL:'https://youtu.be/D0UnqGm_miA'),
  VideoModel(title: 'Jack herer budder by kings garden | Before you DAB', URL:'https://youtu.be/D0UnqGm_miA'),
  VideoModel(title: 'Jack herer budder by kings garden | Before you DAB', URL:'https://youtu.be/D0UnqGm_miA'),
  VideoModel(title: 'Jack herer budder by kings garden | Before you DAB', URL:'https://youtu.be/D0UnqGm_miA'),
];


class SelectVideo extends StatelessWidget {
  const SelectVideo({Key? key, required this.videoModel}) : super(key: key);
  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
