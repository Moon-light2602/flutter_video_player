import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video_player/widget/orientation/video_player_both_widget.dart';
import 'package:video_player/video_player.dart';
// import 'package:wakelock/wakelock.dart';

import '../../main.dart';

class PortraitLandscapePlayerPage extends StatefulWidget {
  const PortraitLandscapePlayerPage({super.key});

  @override
  _PortraitLandscapePlayerPageState createState() =>
      _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState
    extends State<PortraitLandscapePlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(urlLandscapeVideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: VideoPlayerBothWidget(controller: controller),
      );
}
