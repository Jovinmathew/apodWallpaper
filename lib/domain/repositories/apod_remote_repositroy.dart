import 'dart:convert';
import 'package:http/http.dart' as http;

import '../entities/apod.dart';
import 'apod_repository.dart';

class RemoteApodRepository implements ApodRepository {
  final http.Client _client;
  static const _baseUrl = 'https://api.nasa.gov/planetary/apod';
  static const _apiKey = 'bRhzd3RYMFmL8HrVPSgRa4RrsIgl1Gx0opP74nQC';

  RemoteApodRepository(this._client);

  @override
  Future<Apod> getApodForDate(DateTime date) async {
    final uri = Uri.parse('$_baseUrl?api_key=$_apiKey');
    final response = await _client.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Apod(
        date: json['date'],
        explanation: json['explanation'],
        hdUrl: json['hdurl'],
        mediaType: json['media_type'],
        serviceVersion: json['service_version'],
        title: json['title'],
        url: json['url'],
      );
    } else {
      throw Exception('Failed to load APOD');
    }
  }

  @override
  Future<void> saveApodAsWallpaper(Apod apod) {
    // TODO: implement saveApodAsWallpaper
    throw UnimplementedError();
  }
}
