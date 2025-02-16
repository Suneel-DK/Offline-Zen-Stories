import 'package:flutter/material.dart';
import '../models/story_model.dart'; // Import the Story model

/// A widget that displays an offline story with an optional image, title, and content.
///
/// This widget is designed to show motivational or calming stories when the device is offline.
/// It includes:
/// - An optional image (if an asset path is provided).
/// - A story title.
/// - The story content.
/// - A button to refresh the story with a new one.
///
/// The widget is typically used in conjunction with the [ZenWrapper] widget to display
/// offline content when the device loses internet connectivity.
class OfflineStoryWidget extends StatelessWidget {
  /// The path to an optional asset image to display above the story.
  ///
  /// If `null`, a placeholder text will be shown instead.
  final String? assetImagePath;

  /// The height of the image to display.
  ///
  /// Defaults to `200` if not specified.
  final double imageHeight;

  /// The width of the image to display.
  ///
  /// Defaults to `double.infinity` (full width) if not specified.
  final double imageWidth;

  /// The story to display, containing a title and content.
  ///
  /// This is typically a [Story] object fetched from a predefined list of stories.
  final Story story;

  /// A callback function to refresh the story and display a new one.
  ///
  /// This is triggered when the user presses the "New Story" button.
  final VoidCallback onRefresh;

  /// Creates an [OfflineStoryWidget].
  ///
  /// - [assetImagePath]: Optional path to an asset image.
  /// - [imageHeight]: Height of the image (defaults to `200`).
  /// - [imageWidth]: Width of the image (defaults to `double.infinity`).
  /// - [story]: The story to display (must not be `null`).
  /// - [onRefresh]: Callback to refresh the story (must not be `null`).
  const OfflineStoryWidget({
    super.key,
    this.assetImagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.story,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (assetImagePath != null)
              Image.asset(
                assetImagePath!,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              )
            else
              const Text(
                "No image selected. Provide an asset image path.",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            const SizedBox(height: 20),
            Text(
              story.title, // Display the story title
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              story.content, // Display the story content
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: onRefresh,
              child: const Text("New Story"),
            ),
          ],
        ),
      ),
    );
  }
}
