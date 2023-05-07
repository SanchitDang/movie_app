import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/utils/routes/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

