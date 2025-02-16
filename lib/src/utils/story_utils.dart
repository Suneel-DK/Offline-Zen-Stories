import 'dart:math';
import '../models/story_model.dart';
import '../data/story_data.dart';

/// A utility class for managing and retrieving random stories from a predefined list.
/// This class provides a method to fetch a random story from the list of stories
/// defined in [story_data.dart].
class StoryUtils {
  /// Returns a random story from the predefined list of stories.
  /// The story is selected randomly using [Random.nextInt] and returned as a [Story] object.
  /// The list of stories is imported from [story_data.dart].
  static Story getRandomStory() {
    return stories[Random().nextInt(stories.length)];
  }
}
