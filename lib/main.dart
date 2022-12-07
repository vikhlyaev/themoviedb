import 'package:flutter/material.dart';
import 'package:themoviedb/auth/auth_widget.dart';
import 'package:themoviedb/details/details_widget.dart';
import 'package:themoviedb/main/main_screen_widget.dart';
import 'package:themoviedb/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie DB',
      theme: AppTheme().dark,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => AuthWidget(),
        '/main': (context) => MainScreenWidget(),
        '/main/details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return DetailsWidget(id: arguments);
          } else {
            return DetailsWidget(id: 0);
          }
        }
      },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('Navigation error occurred'),
            ),
          );
        });
      },
    );
  }
}
