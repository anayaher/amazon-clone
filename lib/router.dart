import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );
      
       case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
      
    default:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

    // return MaterialPageRoute(
    //   builder: (context) => const Scaffold(
    //     body: Center(
    //       child: Text("This Page Doesn't Exist"),
    //     ),
    //   ),
    // );
  }
}
