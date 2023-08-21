import 'package:flutter/material.dart';

import '../widget/basic/asset_player_widget.dart';
import '../widget/basic/file_player_widget.dart';
import '../widget/basic/network_player_widget.dart';
import '../widget/other/tabbar_widget.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context) => TabBarWidget(
        tabs: const [
          Tab(icon: Icon(Icons.file_copy), text: 'Asset'),
          Tab(icon: Icon(Icons.attach_file), text: 'File'),
          Tab(icon: Icon(Icons.ondemand_video_outlined), text: 'Network'),
        ],
        onTap: (int value) {  },
        children: [
          buildAssets(),
          buildFiles(),
          buildNetwork(),
        ],
      );

  Widget buildAssets() => const AssetPlayerWidget();

  Widget buildFiles() => const FilePlayerWidget();

  Widget buildNetwork() => const NetworkPlayerWidget();
}
