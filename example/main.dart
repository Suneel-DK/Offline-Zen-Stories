import 'package:flutter/material.dart';
import 'package:offline_zen_stories/offline_zen_stories.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZenWrapper(
        onlineWidget: OnlinePage(),
        assetImagePath: 'assets/sample_image.png',
        imageHeight: 300,
        imageWidth: 300,
      ),
    );
  }
}

class OnlinePage extends StatelessWidget {
  const OnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online Mode')),
      body: const Center(child: Text('You are online!')),
    );
  }
}