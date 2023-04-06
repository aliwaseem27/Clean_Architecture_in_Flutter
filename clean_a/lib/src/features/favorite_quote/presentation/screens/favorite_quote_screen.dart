import 'package:clean_a/src/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:flutter/material.dart';

class FavoriteQuoteScreen extends StatelessWidget {
  const FavoriteQuoteScreen({Key? key}) : super(key: key);
  static const String route = "/favorite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Favorite Quote Screen",
              style: TextStyle(color: Colors.black, fontSize: 36),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, QuoteScreen.route),
            child: Text("Return to Quote Page"),
          ),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "undefinedPage"),
              child: Text("Go to undefined page"))
        ],
      ),
    );
  }
}
