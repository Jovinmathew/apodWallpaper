import 'package:flutter/material.dart';
import '../../domain/entities/apod.dart';

class ApodCard extends StatelessWidget {
  final Apod apod;

  ApodCard({required this.apod});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(apod.url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  apod.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(apod.explanation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
