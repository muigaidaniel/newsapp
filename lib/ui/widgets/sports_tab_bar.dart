import 'package:flutter/material.dart';
import 'package:newsapp/models/response.dart';
import 'package:newsapp/services/news_services_api.dart';
import 'package:newsapp/ui/views/news_details.dart';
import 'package:newsapp/ui/widgets/shimmer_listtile.dart';

class SportsTab extends StatelessWidget {
  const SportsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: FutureBuilder<List<Article>>(
              future: NewsServicesApi().getSportsNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: SizedBox(
                            height: 60,
                            width: 60,
                            child: Hero(
                              tag: snapshot.data![index].urlToImage,
                              child: Image.network(
                                snapshot.data![index].urlToImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: SizedBox(
                            height: 50,
                            child: Text(snapshot.data![index].content),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewsDetailsView(
                                    data: snapshot.data![index])));
                          });
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return ListView(
                  children: [
                    shimmerlisttile(),
                    shimmerlisttile(),
                    shimmerlisttile(),
                    shimmerlisttile(),
                    shimmerlisttile(),
                    shimmerlisttile(),
                    shimmerlisttile(),
                    shimmerlisttile(),
                  ],
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
