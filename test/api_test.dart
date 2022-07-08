import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Fetch Restaurant', () {
    test('returns an Restaurant if the http call completes successfully',
        () async {
      final client = MockClient();

      when(client.get(Uri.parse(Api.baseUrl + Api.list)))
          .thenAnswer((_) async => http.Response('{"restaurants":[]}', 200));
      expect(await Api(client).getData(), isA<RestaurantResult>());
    });

    test('Test Error', () async {
      final client = MockClient();
      when(client.get(Uri.parse(Api.baseUrl + Api.list)))
          .thenAnswer((_) async => Future.value(http.Response(
                ''' {
        "message": "Failed Load Data."}''',
                403,
              )));
      expect(Api(client).getData(), throwsException);
    });
  });
}
