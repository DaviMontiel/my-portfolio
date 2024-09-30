import 'package:url_launcher/url_launcher.dart';

class ExternalController {
  void makePhoneCall(String phoneNumber) {
    final Uri url = Uri.parse('tel://$phoneNumber');

    launchUrl(url);
  }
}

final externalController = ExternalController();