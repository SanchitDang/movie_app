import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/utils/routes/route_names.dart';
import 'package:movie_app/view_model/auth_view_model.dart';
import 'package:movie_app/view_model/color_provider.dart';
import 'package:movie_app/view_model/favourites_provider.dart';
import 'package:movie_app/view_model/theme_changer_provider.dart';
import 'package:movie_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => FavouritesProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ],
      child: Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.teal,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.teal
                )
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.teal,
            ),
            initialRoute: RouteNames.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        }
      ),
    );
  }
}

