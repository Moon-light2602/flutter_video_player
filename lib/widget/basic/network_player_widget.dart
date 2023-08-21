import 'package:flutter/material.dart';
import 'package:flutter_video_player/widget/other/floating_action_button_widget.dart';
import 'package:video_player/video_player.dart';

import '../../main.dart';
import '../other/textfield_widget.dart';
import '../video_player_widget.dart';

class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({super.key});

  @override
  _NetworkPlayerWidgetState createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  static const urlNetwork = 'https://www.youtube.com/watch?v=6_EgutCn2Nw';
  final textController = TextEditingController(text: urlNetwork);
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(Uri.parse(textController.text))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller?.play());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
    child: Column(
      children: [
        VideoPlayerWidget(controller: controller!),
        buildTextField(),
      ],
    ),
  );

  Widget buildTextField() => Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            controller: textController,
            hintText: 'Enter Video Url',
          ),
        ),
        const SizedBox(width: 12),
        FloatingActionButtonWidget(
          onPressed: () {
            if (textController.text.trim().isEmpty) return;
          },
        ),
      ],
    ),
  );
}