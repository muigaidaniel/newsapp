import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewModel extends BaseViewModel {
  late WebViewController controller;

  disableHeader() {
    // List<String> exclude = [
    //   '.fi-main-block__title',
    //   'h2',
    //   'header',
    //   '.gamp-article-ad',
    //   'content__byline',
    //   'footer',
    //   '.social__container',
    //   '.gamp-article-ad',
    //   '.latest__container',
    // ];

    //   exclude.map((e) =>
    controller.runJavascript(
        "document.getElmentsByTagName('footer')[0].style.display = 'none';");
    // );
  }
}
