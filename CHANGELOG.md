## 1.1.0

### Added
- **New Stories**: Added 10+ new motivational and calming stories to the `story_data.dart` file. The stories now include themes like patience, perseverance, and mindfulness.
- **Shuffle-and-Cycle Mechanism**: Implemented a new feature in `StoryUtils` to ensure stories are not repeated until all stories have been shown. Once all stories are displayed, the list is reshuffled, and the cycle begins again.

### Changed
- **Story Retrieval Logic**: Updated the `StoryUtils` class to use `getNextStory()` instead of `getRandomStory()`. This ensures a better user experience by avoiding repetitive stories.


## 1.0.1

* First official release of the Offline Zen Stories package.
* Provides randomized calming short stories when the app detects no internet connection.

## Features include:

* Network Detection: Automatically detects offline status.
* Story Display: Displays motivational and calming stories.
* Custom Asset Integration: Allows user-defined asset image configuration.
* Dynamic Updates: Automatic state refresh every 5 seconds for network status changes.

## Enhancements in this Version

* Fully customizable asset image feature with height and width adjustments.
* Seamless story updates when the device goes offline.


