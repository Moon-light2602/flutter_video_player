import 'package:flutter/material.dart';

import '../widget/orientation/landscape_player_page.dart';
import '../widget/orientation/portrait_landscape_player_page.dart';
import '../widget/orientation/portrait_player_widget.dart';
import '../widget/other/tabbar_widget.dart';

class OrientationPage extends StatelessWidget {
  const OrientationPage({super.key});

  @override
  Widget build(BuildContext context) => TabBarWidget(
        onTap: (index) {
          switch (index) {
            case 1:
              goToLandscape(context);
              break;
            case 2:
              goToPortraitAndLandscape(context);
              break;
          }
        },
        tabs: const [
          Tab(icon: Icon(Icons.screen_lock_portrait), text: 'Portrait'),
          Tab(icon: Icon(Icons.screen_lock_landscape), text: 'Landscape'),
          Tab(icon: Icon(Icons.screen_rotation), text: 'Both'),
        ],
        children: [
          buildPortrait(),
          buildLandscape(context),
          buildPortraitAndLandscape(context),
        ],
      );

  Widget buildPortrait() => PortraitPlayerWidget();

  Widget buildLandscape(BuildContext context) => buildButton(
        text: 'Back To Landscape',
        onClicked: () => goToLandscape(context),
      );

  Widget buildPortraitAndLandscape(BuildContext context) => buildButton(
        text: 'Back To Both',
        onClicked: () => goToPortraitAndLandscape(context),
      );

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      Center(
        child: TextButton(
          onPressed: onClicked,
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      );

  void goToLandscape(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LandscapePlayerPage()));

  void goToPortraitAndLandscape(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PortraitLandscapePlayerPage()));
}
