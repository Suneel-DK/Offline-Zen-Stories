import 'package:flutter/material.dart';
import 'package:offline_zen_stories/offline_zen_stories.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZenWrapper(
        onlineWidget: const Center(child: Text("Online Content Here")),
        assetImagePath: 'assets/zen_image.jpg',
        imageHeight: 300,
        imageWidth: 300,
      ),
    );
  }
}
