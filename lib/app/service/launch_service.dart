import 'package:url_launcher/url_launcher_string.dart';

class LaunchService {
  static Future<void> launchWebsite(String? url) async {
    if (url == null) return;

    await launchUrlString(url);
  }
}
