import 'package:flutter/material.dart';
import 'package:movie_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/route_names.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {

    final userPrefProvider = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("H O M E"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => userPrefProvider.logOutUser().then((value) {
              Navigator.pushReplacementNamed(context, RouteNames.login);
            }),
            child: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
