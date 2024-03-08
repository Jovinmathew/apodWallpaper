import 'package:flutter/material.dart';

import '../../application/apod/apod_service.dart';
import '../../domain/entities/apod.dart';
import '../widgets/apod_card.dart';

class HomePage extends StatefulWidget {
  final ApodService apodService;

  const HomePage({Key? key, required this.apodService}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Apod> _apodFuture;

  @override
  void initState() {
    super.initState();
    _apodFuture = widget.apodService.getApodForDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper App'),
      ),
      body: FutureBuilder<Apod>(
        future: _apodFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ApodCard(apod: snapshot.data!);
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
