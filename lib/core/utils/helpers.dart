import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  Future<void> openArticle(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
