import 'package:url_launcher/url_launcher.dart';

class ExternalController {
  void makePhoneCall(String phoneNumber) {
    final Uri url = Uri.parse('tel://$phoneNumber');

    launchUrl(url);
  }

  void openUrl(String link, {LaunchMode mode = LaunchMode.externalApplication}) {
    final Uri url = Uri.parse(link);

    launchUrl(
      url,
      mode: mode,
    );
  }
}

final externalController = ExternalController();