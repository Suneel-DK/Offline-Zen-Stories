# Offline Zen Stories

A Flutter package that provides calming, inspirational short stories when the device detects no internet connection. This package transforms offline moments into peaceful experiences, helping users stay positive and motivated.

---

## Features

- **Offline Stories:** Enjoy a collection of calming stories and positive messages during offline moments.
- **Network Detection:** Automatically switches between online and offline modes.
- **Customizable Image Support:** Allows users to set custom asset images for offline display.
- **Simple Integration:** Easy to implement and extend in any Flutter application.

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  offline_zen_stories:
    git: https://github.com/Suneel-DK/Offline-Zen-Stories
```

Then, fetch the package using:

```bash
flutter pub get
```

Ensure your assets folder contains any custom image you'd like to display:

```yaml
flutter:
  assets:
    - assets/your_image.png
```

---

## Usage

### Basic Example

```dart
import 'package:flutter/material.dart';
import 'package:offline_zen_stories/zen_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online Mode')),
      body: const Center(child: Text('You are online!')),
    );
  }
}
```

---

## API Documentation

### ZenWrapper

- **Parameters:**  
  - `onlineWidget`: Widget to display when the device is online.  
  - `assetImagePath`: (Optional) Path to an asset image shown during offline mode.  
  - `imageHeight`: Height of the asset image in offline mode.  
  - `imageWidth`: Width of the asset image in offline mode.

---

## Customization

- **Images:** Set your custom asset image by specifying the `assetImagePath`.
- **Polling Interval:** Update the polling interval in `ZenWrapper` by changing the timer duration.

---

## License

MIT License
