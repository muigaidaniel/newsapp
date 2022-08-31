import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsViewModel extends BaseViewModel {
  Future<void> openUrl(Uri url) async {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  }
}
