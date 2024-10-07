import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationService {
  Future<LatLng> getCoordinatesFromAddress(String address) async {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final location = jsonResponse['results'][0]['geometry']['location'];
      return LatLng(location['lat'], location['lng']);
    } else {
      throw Exception('Failed to load coordinates');
    }
  }
}
