import 'package:flutter/material.dart';
import 'package:newsapp/models/response.dart';
import 'package:newsapp/viewmodels/news_webviewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatelessWidget {
  final Article data;
  const NewsWebView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsWebViewModel>.reactive(
        viewModelBuilder: () => NewsWebViewModel(),
        builder: (context, model, child) => SafeArea(
              child: WebView(
                initialUrl: '${data.url}',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  model.controller = controller;
                  model.disableHeader();
                },
                onPageStarted: (url) {
                  model.disableHeader();
                },
              ),
            ));
  }
}
