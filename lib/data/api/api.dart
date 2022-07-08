import 'dart:convert';
import 'package:http/http.dart' show Client;

import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/data/model/restaurant_search_response.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';

class Api {
  static const String throws = 'Failed load data.';
  static const baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const list = 'list';

  final Client client;
  Api(this.client);

  Future<RestaurantResult> getData() async {
    final response = await client.get(Uri.parse(baseUrl + list));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      throw Exception(throws);
    }
  }

  Future<RestaurantSearchResult> getSearch(String query) async {
    final response = await client.get(Uri.parse(baseUrl + 'search?q=' + query));
    if (response.statusCode == 200) {
      return RestaurantSearchResult.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      throw Exception(throws);
    }
  }

  Future<RestaurantDetailResult> getDetails(String id) async {
    final response = await client.get(Uri.parse(baseUrl + 'detail/' + id));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception(throws);
    }
  }
}
