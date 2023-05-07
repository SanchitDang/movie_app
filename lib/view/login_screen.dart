import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("L O G I N  "),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child:
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, RouteNames.home), child: Text("3233rr234dgfsgsdg"),

            ),
          )
        ],
      ),
    );
  }
}
