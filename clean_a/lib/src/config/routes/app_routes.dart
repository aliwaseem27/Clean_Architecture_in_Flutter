import 'package:clean_a/src/core/utils/app_strings.dart';
import 'package:clean_a/src/features/favorite_quote/presentation/screens/favorite_quote_screen.dart';
import 'package:clean_a/src/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case QuoteScreen.route:
        return MaterialPageRoute(builder: (context) => QuoteScreen());
      case FavoriteQuoteScreen.route:
        return MaterialPageRoute(builder: (context) => FavoriteQuoteScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(AppStrings.noRouteFound),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/"),
              child: Text("Return to Home page"),
            )
          ],
        ),
      );
    });
  }
}
