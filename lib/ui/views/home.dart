import 'package:flutter/material.dart';
import 'package:newsapp/ui/widgets/crypto_tab_bar.dart';
import 'package:newsapp/ui/widgets/sports_tab_bar.dart';
import 'package:newsapp/ui/widgets/tech_tab_bar.dart';
import 'package:newsapp/viewmodels/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (model) => model.notifyListeners(),
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => DefaultTabController(
              length: 3,
              child: Scaffold(
                  appBar: AppBar(
                    title: const Text('News'),
                    bottom: const TabBar(
                      tabs: [
                        Tab(text: 'Tech'),
                        Tab(text: 'Crypto'),
                        Tab(text: 'Sports'),
                      ], /*isScrollable: true*/
                    ),
                  ),
                  body: const TabBarView(
                    children: [
                      TechTab(),
                      CryptoTab(),
                      SportsTab(),
                    ],
                  )),
            ));
  }
}
