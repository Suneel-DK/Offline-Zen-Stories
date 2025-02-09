import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:offline_zen_stories/src/data/story_data.dart';
import 'dart:math';
import 'dart:async';

import 'models/story_model.dart';

class ZenWrapper extends StatefulWidget {
  final Widget onlineWidget;
  final String? assetImagePath;
  final double imageHeight;
  final double imageWidth;

  const ZenWrapper({
    super.key,
    required this.onlineWidget,
    this.assetImagePath,
    this.imageHeight = 200,
    this.imageWidth = double.infinity,
  });

  @override
  State<ZenWrapper> createState() => _ZenWrapperState();
}

class _ZenWrapperState extends State<ZenWrapper> {
  bool _isOnline = true;
  String _currentStory = "";
  final List<String> _stories = [
    "Calmness is the cradle of power.",
    "A journey of a thousand miles begins with a single step.",
    "The best time to plant a tree was 20 years ago. The second-best time is now.",
    "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
    "Patience is not simply the ability to wait – it’s how we behave while we’re waiting.",
    "Everything you can imagine is real.",
    "A smooth sea never made a skilled sailor.",
    "The mind is everything. What you think, you become.",
    "Don’t count the days, make the days count.",
    "It does not matter how slowly you go as long as you do not stop.",
    "What you get by achieving your goals is not as important as what you become by achieving your goals."
  ];
  late Timer _statusChecker;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _startStatusChecker();
  }

  @override
  void dispose() {
    _statusChecker.cancel();
    super.dispose();
  }

  void _startStatusChecker() {
    _statusChecker = Timer.periodic(
      const Duration(seconds: 2),
      (timer) => _checkConnectivity(),
    );
  }

  Future<void> _checkConnectivity() async {
    bool onlineStatus;
    try {
      final response = await http.get(Uri.parse("https://google.com"));
      onlineStatus = response.statusCode == 200;
    } catch (_) {
      onlineStatus = false;
    }

    if (onlineStatus != _isOnline) {
      setState(() {
        _isOnline = onlineStatus;
        if (!_isOnline) _refreshStory();
      });
    }
  }

  void _refreshStory() {
    setState(() {
      _currentStory = _stories[Random().nextInt(_stories.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: _isOnline ? widget.onlineWidget : _buildOfflineStory(),
      ),
    );
  }

  Widget _buildOfflineStory() {
    if (_currentStory.isEmpty) _refreshStory();
 final Story randomStory = (stories..shuffle()).first;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (widget.assetImagePath != null)
              Image.asset(
                widget.assetImagePath!,
                height: widget.imageHeight,
                width: widget.imageWidth,
                fit: BoxFit.cover,
              )
            else
              const Text(
                "No image selected. Provide an asset image path.",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            const SizedBox(height: 20),
            Text(
              randomStory.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              randomStory.content,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),TextButton( onPressed: _refreshStory, child: const Text("New Story"))
          ],
        ),
      ),
    );
  }
}
