import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'application/apod/apod_service.dart';
import 'domain/repositories/apod_remote_repositroy.dart';
import 'domain/repositories/apod_repository.dart';
import 'domain/use_cases/get_apod_for_date.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final http.Client httpClient = http.Client();
  final ApodRepository apodRepository = RemoteApodRepository(http.Client());
  final GetApodForDate getApodForDate =
      GetApodForDate(RemoteApodRepository(http.Client()));
  final ApodService apodService =
      ApodService(GetApodForDate(RemoteApodRepository(http.Client())));

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      home: HomePage(
        apodService: apodService,
      ),
    );
  }
}
