import 'package:newsapp/core/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToNewsDetails() {
    _navigationService.navigateTo('/news_details');
  }
}
