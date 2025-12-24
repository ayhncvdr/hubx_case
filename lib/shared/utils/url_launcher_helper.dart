import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  UrlLauncherHelper._();

  static Future<bool> launchQuestionUrl(String? uri) async {
    if (uri == null || uri.isEmpty) {
      debugPrint('UrlLauncherHelper: URI is null or empty');
      return false;
    }

    try {
      final parsedUri = Uri.parse(uri);
      final launched = await launchUrl(
        parsedUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint('UrlLauncherHelper: Failed to launch URL: $uri');
      }

      return launched;
    } catch (e) {
      debugPrint('UrlLauncherHelper: Error launching URL: $uri, error: $e');
      return false;
    }
  }
}
