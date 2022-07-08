import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles_app.dart';
import 'package:restaurant_app/data/database/convert_data.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/provider/database_provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  final RestaurantDetail restaurants;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)),
      child: Consumer<DatabaseProvider>(
        builder: (context, value, child) {
          return FutureBuilder<bool>(
            future: value.isFavorite(restaurants.id),
            builder: (context, snapshot) {
              var isBookmarked = snapshot.data ?? false;
              return isBookmarked
                  ? Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: colorGrey.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: buttonFavorite,
                        ),
                        onPressed: () => value.removeRestaurant(restaurants.id),
                      ),
                    )
                  : Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: colorGrey.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                        ),
                        onPressed: () =>
                            value.addRestaurant(convertData(restaurants)),
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
