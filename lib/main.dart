import 'package:flutter/material.dart';
import 'package:flutter_video_player/page/basics_page.dart';
import 'package:flutter_video_player/page/orientation_page.dart';

const urlLandscapeVideo =
    'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';
const urlPortraitVideo =
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
const urlYoutubeVideo = 'https://youtube.com/watch?v=HSAa9yi0OMA';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Video Player',
    theme: ThemeData(
      primaryColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme.dark(),
    ),
    home: const MainPage(),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: buildBottomBar(),
    body: buildPages(),
  );

  Widget buildBottomBar() {
    const style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items:  const [
        BottomNavigationBarItem(
          icon: Text('VideoPlayer', style: style),
          label: ('Basics'),
        ),
        BottomNavigationBarItem(
          icon: Text('VideoPlayer', style: style),
          label: ('Orientation'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const BasicsPage();
      case 1:
        return const OrientationPage();
      default:
        return Container();
    }
  }
}
