import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tybatest/models/restaurants_response.dart';

mixin RestaurantApi {
  Future<RestaurantsResponse?> doSearch(String restaurant);
}

@Injectable(as: RestaurantApi)
class RestaurantApiAdapter implements RestaurantApi {
  var client = http.Client();
  @override
  Future<RestaurantsResponse?> doSearch(String restaurant) async {
    try {
      var response = await client.get(
        Uri.parse(
            'https://api.foursquare.com/v3/places/search?near=$restaurant'),
        headers: {
          'Accept': 'application/json',
          //TODO ADD KEY IN AUTHORIZATION
          //   'Authorization': '$key',
        },
      );
      _showLogs(response);
      var mapper = getBody(response.bodyBytes);
      return RestaurantsResponse.fromJson(mapper);
    } catch (_) {
      print("fail mapper");
      return null;
    } finally {
      //client.close();
    }
  }

  dynamic getBody(body) {
    String bodyString;
    if (body is String) {
      bodyString = body;
    } else {
      bodyString = utf8.decode(body);
    }
    try {
      return jsonDecode(bodyString);
    } catch (_) {
      return bodyString;
    }
  }

  void _showLogs(http.BaseResponse response) {
    JsonDecoder decoder = JsonDecoder();
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    log(response.request!.url.toString(), name: 'url');
    log(response.request!.method, name: 'method');
    log(response.statusCode.toString(), name: 'statusCode');
    if (response is http.Response) {
      var object = decoder.convert(response.body);
      var prettyString = encoder.convert(object);
      log('''-----RESPONSE----
      $prettyString
      -----END RESPONSE----
      ''', name: 'responseBody');
    }
  }
}
