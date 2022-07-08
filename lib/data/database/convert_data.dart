import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';

Restaurant convertData(RestaurantDetail detailRestaurant) {
  return Restaurant(
    id: detailRestaurant.id,
    name: detailRestaurant.name,
    description: detailRestaurant.description,
    pictureId: detailRestaurant.pictureId,
    city: detailRestaurant.city,
    rating: detailRestaurant.rating.toString(),
  );
}
