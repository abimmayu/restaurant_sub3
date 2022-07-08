import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/presentation/search_screen.dart';
import 'package:restaurant_app/ui/widgets/restaurant_card.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantListProvider>(
      builder: ((context, value, _) {
        if (value.resultState == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (value.resultState == ResultState.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Restaurant'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.pushNamed(context, SearchScreen.routeName);
                    },
                  ),
                ],
              ),
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: value.restaurant.restaurants.length,
                itemBuilder: (BuildContext context, index) {
                  var restaurant = value.restaurant.restaurants[index];
                  return Cards(restaurant: restaurant);
                },
              ),
            );
          } else if (value.resultState == ResultState.noData) {
            return Center(
              child: Text(value.message),
            );
          } else if (value.resultState == ResultState.error) {
            return Center(
              child: Text(value.message),
            );
          } else {
            return const Center(
              child: Text(""),
            );
          }
        }
      }),
    );
  }
}
