import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/ui/widgets/detail_screen.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail_screen";

  final Restaurant restaurant;

  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (_) => RestaurantDetailProvider(
          api: Api(Client()), restaurants: restaurant.id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Restaurant"),
        ),
        body: Consumer<RestaurantDetailProvider>(
          builder: (context, value, _) {
            if (value.resultState == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (value.resultState == ResultState.hasData) {
              return Scaffold(
                body: DetailScreen(
                  restaurants: value.restaurantDetailResult.restaurants,
                ),
              );
            } else if (value.resultState == ResultState.noData) {
              return Center(child: Text(value.message));
            } else if (value.resultState == ResultState.error) {
              return Center(child: Text(value.message));
            } else {
              return const Center(child: Text(''));
            }
          },
        ),
      ),
    );
  }
}
