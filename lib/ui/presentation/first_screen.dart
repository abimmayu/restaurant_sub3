import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/presentation/search_screen.dart';
import 'package:restaurant_app/ui/home_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/second_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text("Restaurant")),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const HomePage(),
    );
  }
}
