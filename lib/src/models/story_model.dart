/// Represents a story with a title and content.
class Story {
  /// The title of the story.
  final String title;
   /// The content or body of the story.
  final String content;

 /// Creates a [Story] instance with a [title] and [content].
  ///
  /// Both [title] and [content] are required to initialize the story.
  Story({required this.title, required this.content});
}
