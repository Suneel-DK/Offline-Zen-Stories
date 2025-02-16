import 'package:http/http.dart' as http;

/// A utility class for checking network connectivity.
///
/// This class provides a method to check if the device is online by attempting
/// to make a network request to a reliable endpoint (e.g., Google).
class NetworkUtils {
  /// Checks the device's network connectivity by making a request to a reliable endpoint.
  ///
  /// Returns `true` if the device is online and the request is successful (status code 200).
  /// Returns `false` if the request fails or an exception occurs (e.g., no internet connection).
  static Future<bool> checkConnectivity() async {
    try {
      final response = await http.get(Uri.parse("https://google.com"));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
