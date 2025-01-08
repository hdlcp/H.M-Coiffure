import 'package:flutter/material.dart';
import '../screens/loading_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/choose_post_screen.dart';

class AppRoutes {
  static const String loading = '/';
  static const String welcome = '/welcome';
  static const String choosePost = '/choose_post';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loading:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case choosePost:
        return MaterialPageRoute(builder: (_) => const ChoosePostScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
