import 'package:flutter/material.dart';
import 'package:newsapp/models/response.dart';
import 'package:newsapp/ui/views/news_webview.dart';
import 'package:newsapp/viewmodels/news_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NewsDetailsView extends StatelessWidget {
  final Article data;
  const NewsDetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsDetailsViewModel>.nonReactive(
        viewModelBuilder: (() => NewsDetailsViewModel()),
        builder: (context, model, child) => Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    expandedHeight: 200,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Hero(
                          tag: data.urlToImage,
                          child: Image.network(
                            data.urlToImage,
                            height: 200,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ],
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(data.description),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(data.content),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Published at: '),
                                Text(data.publishedAt.trim().split('T')[0]),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(data.publishedAt
                                    .trim()
                                    .split('Z')[0]
                                    .substring(11)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        NewsWebView(data: data)));
                              },
                              child: const Text('Read More'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
