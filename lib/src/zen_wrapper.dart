import 'package:flutter/material.dart';
import 'dart:async';
import '../offline_zen_stories.dart';
import 'utils/network_utils.dart';
import 'utils/story_utils.dart';
import 'widgets/offline_story_widget.dart';

/// A wrapper widget that switches between online and offline content based on network status.
///
/// When the device is online, it displays the [onlineWidget].
/// When the device is offline, it shows a random story from a predefined list.
///
/// This widget checks network connectivity every 2 seconds and updates the content accordingly.
class ZenWrapper extends StatefulWidget {
  /// The widget to display when the device is online.
  final Widget onlineWidget;

  /// Optional asset image path to display when the offline story is shown.
  final String? assetImagePath;

  /// The height of the image shown with the offline story.
  final double imageHeight;

  /// The width of the image shown with the offline story.
  final double imageWidth;

  /// Creates a [ZenWrapper] to manage online and offline content display.
  ///
  /// [onlineWidget] is required, while [assetImagePath], [imageHeight], and [imageWidth]
  /// are optional.
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
  Story _currentStory = Story(title: "", content: ""); 
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
    final onlineStatus = await NetworkUtils.checkConnectivity();
    if (onlineStatus != _isOnline) {
      setState(() {
        _isOnline = onlineStatus;
        if (!_isOnline) _refreshStory();
      });
    }
  }

  void _refreshStory() {
    setState(() {
      _currentStory = StoryUtils.getRandomStory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: _isOnline
            ? widget.onlineWidget
            : OfflineStoryWidget(
                assetImagePath: widget.assetImagePath,
                imageHeight: widget.imageHeight,
                imageWidth: widget.imageWidth,
                story: _currentStory, // Pass the current story
                onRefresh: _refreshStory,
              ),
      ),
    );
  }
}
